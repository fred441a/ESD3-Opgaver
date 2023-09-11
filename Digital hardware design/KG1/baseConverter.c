#include <stdint.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
#define OUTPUT_BUFFER_LENGTH 32*2

int log_a_to_base_b(int a, int b)
{
    return log2(a) / log2(b);
}

// output buffer, +1 for NULL termination
char outputBuffer[OUTPUT_BUFFER_LENGTH + 1] = {};

int convert_dec_num_to_base(uint32_t decNum, uint8_t base) {
  // get the largest exponent position needded
  int16_t maxExp = log_a_to_base_b(decNum, base);
  uint8_t outputIdx = 0;

  for (; maxExp >= 0; maxExp--) {
    // calculate exponent for current location
    uint32_t exp = pow(base, maxExp);

    // for DEBUG
    // printf("exp: %d, val: %d\n", exp, (decNum / exp));

    // calculate value for current exponent, "+48" converts number to ASCII chars
    int addedChars = sprintf(outputBuffer + outputIdx, "%d ", (decNum / exp));
    if (addedChars < 0) return -1; // error appending characters
    outputIdx += addedChars;

    // set input number to remainder after current exponent
    decNum %= exp;
  }

  // return the length of the output excluding the null-character appended at the end of the string
  return outputIdx;
}

// Driver code
int main()
{
  time_t t;
  /* Intializes random number generator */
  srand((unsigned) time(&t));

  int numToConvert = rand() % 0xffffffff;
  int toBase = rand() % 0xf;
  printf("Convert: %d decimal to base %d\n", numToConvert, toBase);

  int resultLength = convert_dec_num_to_base(numToConvert, toBase);
  printf("Result length: %d\n", resultLength);
  printf("Result: %s\n", outputBuffer);
     
  return 0;
}