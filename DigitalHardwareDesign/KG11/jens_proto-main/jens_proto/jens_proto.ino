#include <FastCRC.h>
FastCRC16 CRC16;

#pragma pack(1)
struct layer3Master{
    char RSSI;
    //LSBYte
    char TxID[3];
    char TxID_time[2];
};

struct layer3Packet{
    char type;
    char ReceiverID_Low;
    char ReceiverID_Middle;
    char ReceiverID_High;
    char TransducerLevel;
    char QuiteTime;
    char N;
    layer3Master Master[25];
};

struct layer2Packet{
    const char start = 0x02;
    char length;
    //char data[255];
    layer3Packet data;
    uint16_t crc;
    const char stop = 0x03;
};
#pragma pack()

void sendPacket(layer2Packet packet){
    Serial.write(packet.start);
    Serial.write(( uint8_t )packet.length);
    for(int i = 0; i < packet.length;i++) {
        if(((uint8_t*)&packet.data)[i] == 0x02){
            Serial.write(0x10);
            Serial.write(0x02+0x20);
        }
        else if(((uint8_t*)&packet.data)[i] == 0x03){
            Serial.write(0x10);
            Serial.write(0x03+0x20);
        }
        else if(((uint8_t*)&packet.data)[i] == 0x10){
            Serial.write(0x10);
            Serial.write(0x10+0x20);
        }else{
            Serial.write(((uint8_t*)&packet.data)[i]);
        }

    }
    Serial.write((uint8_t *)&packet.crc, 2); // send 2 byte CRC
    Serial.write((uint8_t)packet.stop);

}

layer2Packet makeLayer2Packet(layer3Packet packet){
    layer2Packet returnPacket;
    returnPacket.length = (sizeof(layer3Master)*packet.N)+7; // 7 is the size of layer3Packet excluding "Master" array  
    returnPacket.data = packet;
    returnPacket.crc = CRC16.ccitt(((uint8_t*)&packet), returnPacket.length);
    return returnPacket;
}

void generatePacketAndSend() {
    layer3Packet notSoCoolPacket;
    notSoCoolPacket.type = 0x01;
    notSoCoolPacket.ReceiverID_Low = 0x02;
    notSoCoolPacket.ReceiverID_Middle = 0x03;
    notSoCoolPacket.ReceiverID_High = 0x04;
    notSoCoolPacket.TransducerLevel = 0x05;
    notSoCoolPacket.QuiteTime = 0x06;
    notSoCoolPacket.N = 0x03;
    for (int i = 0; i < 3; i++)
    {
        notSoCoolPacket.Master[i].RSSI = 0x01;
        notSoCoolPacket.Master[i].TxID[0] = 0x02;
        notSoCoolPacket.Master[i].TxID[1] = 0x02;
        notSoCoolPacket.Master[i].TxID[2] = 0x02;
        notSoCoolPacket.Master[i].TxID_time[0]=0x01;
        notSoCoolPacket.Master[i].TxID_time[1]=0x02;
    }


    layer2Packet MegaCoolPacket = makeLayer2Packet(notSoCoolPacket);
    sendPacket(MegaCoolPacket);
}

enum recieveStateType {IDLE, STARTED, ESCAPED};
enum recieveStateType recieveState = IDLE;

int bufferPtr = 0;
layer2Packet recievedPaccketBuffer;

bool recievePacket() {
    bool packetRecieved = false;
    if (!Serial.available())
        return packetRecieved;
    
    char incomingByte = Serial.read();
    if (recieveState == IDLE && incomingByte == 0x02) {
        recieveState = STARTED;
        bufferPtr = 0;
    } else if (recieveState == STARTED && incomingByte == 0x10) {
        recieveState = ESCAPED;
        return packetRecieved; // ignore stuffed byte
    } else if ((recieveState == STARTED && incomingByte == 0x03) || bufferPtr >= sizeof(layer2Packet)) {
        recieveState = IDLE;
        packetRecieved = true;
    } else if (recieveState == ESCAPED) {
        recieveState = STARTED;
        incomingByte -= 0x20;
    }

    ((uint8_t*)&recievedPaccketBuffer)[bufferPtr++] = incomingByte;
    return packetRecieved;
}

void printInfo() {
    // Print number of "masters in range"
    // Print Id values and Time values for all received data (1-N) (see below)
    Serial.println("Packet recieved!");
    Serial.print("Masters in range: 0x"); Serial.println(recievedPaccketBuffer.data.N, HEX);
    for (int i = 0; i < recievedPaccketBuffer.data.N; i++)
    {
        // Print master ID
        Serial.print("Master ID: 0x"); 
        Serial.print(recievedPaccketBuffer.data.Master[i].TxID[2], HEX); // MSB
        Serial.print(recievedPaccketBuffer.data.Master[i].TxID[1], HEX); // Middle byte 
        Serial.print(recievedPaccketBuffer.data.Master[i].TxID[0], HEX); // LSB
        Serial.println();

        // print master time
        Serial.print("Time: 0x"); 
        Serial.print(recievedPaccketBuffer.data.Master[i].TxID_time[1], HEX); // MSB
        Serial.print(recievedPaccketBuffer.data.Master[i].TxID_time[0], HEX); // LSB
        Serial.println();
        Serial.println();
    }
}

void setup(){
    Serial.begin(9600);
    // generatePacketAndSend(); // enable this on sender
}


void loop(){
    // delay(1000); // enable this on sender
    bool newPacket = recievePacket();
    if (newPacket) printInfo();
}
