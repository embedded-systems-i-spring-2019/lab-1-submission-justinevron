----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 12:24:39 PM
-- Design Name: 
-- Module Name: counter_top - structure
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

entity counter_top is
    port( clock : in std_logic;
          btn : in std_logic_vector(3 downto 0);
          sw : in std_logic_vector(3 downto 0);
          led : out std_logic_vector(3 downto 0));
end counter_top;

architecture structure of counter_top is
component debounce is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC;
           debounced : out STD_LOGIC);
end component;
component clockdivider is
    Port (clk_slow : out STD_LOGIC;
          clk : in STD_LOGIC);
end component;
component fancy_counter
Port ( clk : in STD_LOGIC;
       clk_en : in STD_LOGIC;
       dir : in STD_LOGIC;
       en : in STD_LOGIC;
       ld : in STD_LOGIC;
       rst : in STD_LOGIC;
       updn : in STD_LOGIC;
       val : in STD_LOGIC_VECTOR (3 downto 0);
       cnt : out STD_LOGIC_VECTOR (3 downto 0));
end component;
    signal div, dbnc1, dbnc2, dbnc3,dbnc4 : std_logic;
begin
    debnc1: debounce
    port map(clk => clock,
             debounced => dbnc1,
             btn => btn(0));
    debnc2: debounce
    port map(clk => clock,
             debounced => dbnc2,
             btn => btn(1));
    debnc3: debounce
    port map(clk => clock,
             debounced => dbnc3,
             btn => btn(2));
    debnc4: debounce
    port map(clk => clock,
             debounced => dbnc4,
             btn => btn(3));
    clkdiv: clockdivider
    port map(clk => clock,
            clk_slow => div);
    counter: fancy_counter
    port map(clk => clock,
             clk_en => div,
             dir => sw(0),
             en => dbnc2,
             ld => dbnC4,
             rst => dbnc1,
             updn => dbnc3,
             val => sw,
             cnt => led);
            
end structure;
