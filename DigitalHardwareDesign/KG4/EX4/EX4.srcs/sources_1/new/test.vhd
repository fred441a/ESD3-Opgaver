----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2023 12:50:13 PM
-- Design Name: 
-- Module Name: 4-bit-buffer - Behavioral
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

entity Bit4Buffer is
    Port ( input_bus : in STD_LOGIC_VECTOR (3 downto 0);
           output_bus : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           WRITE : in STD_LOGIC;
           READ : in STD_LOGIC);
end Bit4Buffer;

architecture Behavioral of Bit4Buffer is
signal internal_buffer : std_logic_vector (3 downto 0);
begin

process (clk)
begin  
      if WRITE = '1' then
         internal_buffer (3 downto 0) <= input_bus (3 downto 0);
      elsif READ = '1' then
         output_bus (3 downto 0) <= internal_buffer (3 downto 0);      
      end if;
end process;

end Behavioral;