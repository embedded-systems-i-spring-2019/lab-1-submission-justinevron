----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 12:52:19 PM
-- Design Name: 
-- Module Name: counter_tb - Behavioral
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

entity counter_tb is
--  Port ( );
end counter_tb;

architecture testbench of counter_tb is
component fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : inout STD_LOGIC_VECTOR (3 downto 0));
end component;
signal clk_tb, clken_tb, dir_tb, en_tb, ld_tb, rst_tb, updn_tb: std_logic;           
signal val_tb, cnt_tb : std_logic_vector(3 downto 0);
begin
counter: fancy_counter
port map(clk => clk_tb,
         clk_en => clken_tb,
         dir => dir_tb,
         en =>en_tb,
         ld => ld_tb,
         rst => rst_tb,
         updn => updn_tb,
         val => val_tb,
         cnt => cnt_tb);
 clk_gen_proc: process
    begin
    
        wait for 4 ns;
        clk_tb <= '1';
        
        wait for 4 ns;
        clk_tb <= '0';
    
    end process clk_gen_proc;
cnt_proc: process
begin
    clken_tb <= '1';
    en_tb <= '1';
    dir_tb <= '1';
    updn_tb <= '1';
    val_tb <= "1100";
    ld_tb <= '1';
    rst_tb <= '1';
    wait for 8 ns;
    updn_tb <= '0';
    ld_tb <= '0';
    rst_tb <= '0';
    wait for 92 ns;
    clken_tb <= '1';
    en_tb <= '1';
    dir_tb <= '0';
    updn_tb <= '1';
    val_tb <= "1100";
    ld_tb <= '1';
    rst_tb <= '1';
    wait for 8 ns;
    updn_tb <= '0';
    ld_tb <= '0';
    rst_tb <= '0';
    wait for 92 ns;
end process cnt_proc;
end testbench;
