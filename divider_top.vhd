----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 09:12:04 PM
-- Design Name: 
-- Module Name: divider_top - Behavioral
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

entity divider_top is
    Port ( led0 : inout STD_LOGIC;
           clk : in STD_LOGIC);
end divider_top;

architecture Behavioral of divider_top is
component clockdivider is
    Port (clk_slow : out STD_LOGIC;
          clk : in STD_LOGIC);
end component;
signal enable : STD_LOGIC;
begin
clockdiv: clockdivider
    port map(clk_slow => enable,
             clk => clk);
process(clk)
begin
    if rising_edge(clk) and enable = '1' then
        led0 <= NOT(led0);
    end if;
end process;

end Behavioral;
