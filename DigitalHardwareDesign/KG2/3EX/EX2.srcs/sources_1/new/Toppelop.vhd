----------------------------------------------------------------------------------
-- Company: 
-- Engineer: the boys og ditte
-- 
-- Create Date: 07.09.2023 11:31:27
-- Design Name: 
-- Module Name: Toppelop - Behavioral
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

entity Toppelop is
    Port ( SW0 : in STD_LOGIC;
           SW1 : in STD_LOGIC;
           SW2 : in STD_LOGIC;
           SW3 : in STD_LOGIC;
           LED : out STD_LOGIC);
end Toppelop;

architecture Behavioral of Toppelop is
signal and1_result : std_logic;
signal and2_result : std_logic;
begin
bund1 : entity work.bunden
port map(
a => SW0,
b => SW1,
c => and1_result
);
bund2 : entity work.bunden
port map(
a => SW2,
b => SW3,
c => and2_result
);

LED <= SW2 and SW3; --and1_result; --or (not and1_result);

end Behavioral;
