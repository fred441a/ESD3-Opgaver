----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2023 10:25:23
-- Design Name: 
-- Module Name: Top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( Knap : in STD_LOGIC;
           Rot : out STD_LOGIC;
           Gelb : out STD_LOGIC;
           Grun : out STD_LOGIC);
end Top;

architecture Behavioral of Top is

signal State: std_logic_vector (1 downto 0):="00";

begin

process (Knap)
begin
    if(Knap'event and Knap='1') then
        State(1)<= State(0) XOR State(1);
        State(0)<= State(0) XOR '1';
        if (State(0)='0' and State(1)='0') then
            Grun <= '0';
            Gelb <= '0';
            Rot <= '1';
        elsif(State(0)='1' and State(1)='0') then
            Grun <= '0';
            Gelb <= '1';
            Rot <= '1';
        elsif(State(0)='0' and State(1)='1') then
            Grun <= '1';
            Gelb <= '0';
            Rot <= '0';
        elsif(State(0)='1' and State(1)='1') then
            Grun <= '0';
            Gelb <= '1';
            Rot <= '0';
        end if;
    end if;
end process;

end Behavioral;
