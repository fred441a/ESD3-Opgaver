----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/12/2024 01:33:12 PM
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( 
        count : inout STD_LOGIC_VECTOR (5 downto 0) := (others => '0');
        clk: in std_logic
    );
end Top;

architecture Behavioral of Top is
    type tstate is (INCREMENT, DECREMENT, FINISH);
    signal state : tstate := INCREMENT;
    signal max : INTEGER := 59;
begin

    --count <= "0"; -- initialize

process (clk) begin
    if (rising_edge(clk)) then
         if (state = INCREMENT) then
            count <= std_logic_vector(unsigned(count) + 1);
            if (unsigned(count)+1 = max) then
                state <= DECREMENT;
            end if;
         elsif (state = DECREMENT) then
            count <= std_logic_vector(unsigned(count) - 1);
            if (unsigned(count)-1 = 0) then
                state <= FINISH;
             end if;
         end if;                
    end if;
end process;

end Behavioral;
