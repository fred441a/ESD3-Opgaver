----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.09.2023 10:13:44
-- Design Name: 
-- Module Name: CeresTop - Behavioral
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

entity CeresTop is
    Port ( L1 : out STD_LOGIC;
           L2 : out STD_LOGIC;
           L3 : out STD_LOGIC;
           L4 : out STD_LOGIC;
           K1 : in STD_LOGIC;
           K2 : in STD_LOGIC;
           K3 : in STD_LOGIC;
           K4 : in STD_LOGIC);
end CeresTop;

architecture Behavioral of CeresTop is

begin
L1<=K1;
L2<=K2;
L3<= not K3;
L4<= not K4;

end Behavioral;
