----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2019 09:14:24 PM
-- Design Name: 
-- Module Name: CLK_tb - testbench
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


entity CLK_tb is
end CLK_tb;

architecture testbench of CLK_tb is
component clockdivider is
    Port (clk_slow : out STD_LOGIC;
          clk : in STD_LOGIC);
    end component;
    signal clk_tb: std_logic;
    signal clk_div : std_logic;
begin
    clk_gen_proc: process
    begin
    
        wait for 4 ns;
        clk_tb <= '1';
        
        wait for 4 ns;
        clk_tb <= '0';
    
    end process clk_gen_proc;
    clkdiv: clockdivider
    port map( clk => clk_tb,
             clk_slow => clk_div);
             
end testbench;
