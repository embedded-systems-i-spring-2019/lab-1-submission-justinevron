----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:32:19 AM
-- Design Name: 
-- Module Name: debounce_tb - Behavioral
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

entity debounce_tb is
end debounce_tb;

architecture testbench of debounce_tb is
Component debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           debounced : out STD_LOGIC);
end component;
SIGNAL clk_TB : STD_LOGIC;
SIGNAL btn_TB : STD_LOGIC;
SIGNAL dbnc : STD_LOGIC;
begin
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        clk_tb <= '1';
        
        wait for 4 ns;
        clk_tb <= '0';
    
    end process clk_gen_proc;
    btn_sim: process
    begin
        wait for 8 ns;
        btn_tb <= '1';
        wait for 16 ns;
        btn_tb <= '0';
        wait for 16 ns;
        btn_tb <= '1';
        wait for 40 ms;
        btn_tb <= '0';
        wait for 20 ms; 
    end process;
    debnc: debounce
        port map(clk => clk_tb,
                 btn => btn_tb,
                 debounced => dbnc);
end testbench;
