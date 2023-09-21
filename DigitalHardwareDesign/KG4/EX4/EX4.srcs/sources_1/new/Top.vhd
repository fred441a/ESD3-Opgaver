----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2023 09:19:16 AM
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
    Port ( In_bus : in STD_LOGIC_VECTOR (3 downto 0);
           Out_bus : out STD_LOGIC_VECTOR (3 downto 0);
           CLK : in STD_LOGIC);
end Top;

architecture Behavioral of Top is

component Bit4Buffer
 Port ( input_bus : in STD_LOGIC_VECTOR (3 downto 0);
           output_bus : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           WRITE : in STD_LOGIC;
           READ : in STD_LOGIC);
           
end component;

signal buf1to2 : STD_LOGIC_VECTOR(3 downto 0);
signal buf2to3 : STD_LOGIC_VECTOR(3 downto 0);
signal notCLK: std_logic;

begin

notCLK <= not CLK;

Buf1 : Bit4Buffer
port map (
input_bus => In_bus,
output_bus => buf1to2,
clk => CLK,
WRITE => CLK,
READ => notCLK
);

Buf2 : Bit4Buffer
port map (
input_bus => buf1to2,
output_bus => buf2to3,
clk => CLK,
WRITE => notCLK,
READ => CLK 
);

Buf3 : Bit4Buffer
port map (
input_bus => buf2to3,
output_bus => Out_bus,
clk => CLK,
WRITE => CLK,
READ => notCLK 
);





end Behavioral;
