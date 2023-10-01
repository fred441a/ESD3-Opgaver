----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.09.2023 11:51:02
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( BTNA : in STD_LOGIC;
           BTNB : in STD_LOGIC;
           NCAR : inout STD_LOGIC_VECTOR (7 downto 0) := "00000001"
           -- PLUS : out STD_LOGIC;
           -- Minus : out STD_LOGIC
           );           
end Top;

architecture Behavioral of Top is
signal state : std_logic_vector (2 downto 0); -- := "000";

begin

-- States:
-- 0;'000' = "Passive - waiting for a car to enter/leave"
-- 1;'001' = "Car has triggered only sensor 'A' - entering"
-- 2;'010' = "Car has triggered both sensor 'A' and 'B' - entering"
-- 3;'011' = "Car has triggered only sensor 'B' - entering"

-- 4;'100' = "Car has triggered only sensor 'B' - leaving"
-- 5;'101' = "Car has triggered both sensor 'B' and 'A' - leaving"
-- 6;'110' = "Car has triggered only sensor 'A' - leaving"

process (BTNA, BTNB)
begin   
   if (state = "000" and BTNA = '1' and BTNB = '0') then
      state <= "001"; -- State 1
   elsif (state = "001" and BTNA = '1' and BTNB = '1') then
      state <= "010"; -- State 2
   elsif (state = "010" and BTNA = '0' and BTNB = '1') then
      state <= "011"; -- State 3
   elsif (state = "011" and BTNA = '0' and BTNB = '0') then
      state <= "000"; -- One car has entered, reset and add one
      NCAR <= std_logic_vector(unsigned(NCAR) + 1);
   elsif (state = "000" and BTNA = '0' and BTNB = '1') then
      state <= "100"; -- State 4
   elsif (state = "100" and BTNA = '1' and BTNB = '1') then
      state <= "101"; -- State 5
   elsif (state = "101" and BTNA = '1' and BTNB = '0') then
      state <= "110"; -- State 6
   elsif (state = "110" and BTNA = '0' and BTNB = '0') then
      state <= "000"; -- One car has left, reset and subtract one
      NCAR <= std_logic_vector(unsigned(NCAR) - 1);
   else
    state <= "000"; -- unexpected state, reset
   end if;
end process;

end Behavioral;
