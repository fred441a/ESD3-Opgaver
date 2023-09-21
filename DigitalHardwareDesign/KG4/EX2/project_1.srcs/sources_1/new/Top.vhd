----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2023 10:42:16 AM
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
    Port ( SW0 : in STD_LOGIC;
           BT0 : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR(0 to 3)
           );
end Top;

architecture Behavioral of Top is


begin
process (BT0)
    variable buff:std_logic_vector(0 to 3);
    
    begin
    
    if(BT0'event and BT0 = '1') then
    
    buff(1 to 3) := buff(0 to 2);
    buff(0) := SW0;
    LED(0 to 3) <= buff(0 to 3);
    
    end if;
    
    end process;


end Behavioral;



