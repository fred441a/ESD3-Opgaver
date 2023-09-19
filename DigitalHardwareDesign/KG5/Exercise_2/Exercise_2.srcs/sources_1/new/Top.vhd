----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/19/2023 10:14:22 AM
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
    Port ( 
    LED : out STD_LOGIC_VECTOR (7 downto 0);
    ONLED: out STD_LOGIC;
    CLK : in STD_LOGIC
    );
end Top;

architecture Behavioral of Top is

signal i:unsigned(23 downto 0);


begin
LED <= std_logic_vector(i(23 downto 16));

process(clk)

    begin
    if(clk'event and clk = '1' ) then
    
    i <= i+1;
    
    if(i>512) then
        ONLED <= '1';
    end if;
    
    if (i<512) then
        ONLED <= '0';
    end if; 
    
    --test := TO_INTEGER(unsigned(buff))+1;
    --buff := std_logic_vector(to_unsigned(test, buff'length));
    
    
    end if;

    end process;


end Behavioral;
