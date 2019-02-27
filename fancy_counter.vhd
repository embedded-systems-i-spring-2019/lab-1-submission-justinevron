----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2019 11:58:53 AM
-- Design Name: 
-- Module Name: fancy_counter - Behavioral
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

entity fancy_counter is
    Port ( clk : in STD_LOGIC;
           clk_en : in STD_LOGIC;
           dir : in STD_LOGIC;
           en : in STD_LOGIC;
           ld : in STD_LOGIC;
           rst : in STD_LOGIC;
           updn : in STD_LOGIC;
           val : in STD_LOGIC_VECTOR (3 downto 0);
           cnt : inout STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal dir_reg : std_logic;
signal value : std_logic_vector(3 downto 0);
begin
process(clk)
begin
    if en = '1' then
        if rising_edge(clk) and rst = '1' then
            cnt <= "0000";
        end if;
        if clk_en = '1' then
            if rising_edge(clk) then
                if updn = '1' then
                    dir_reg <= dir;
                end if;
                if ld = '1' then
                   value <= val;
                end if;
                if dir_reg = '1' and cnt < value then
                    cnt <= STD_LOGIC_VECTOR(unsigned(cnt) +1);
                elsif dir_reg = '1' and cnt = value then
                    cnt <= "0000";    
                elsif dir_reg = '0' and cnt > "0000" then
                     cnt <= STD_LOGIC_VECTOR(unsigned(cnt) -1);
                elsif dir_reg = '0' and cnt = "0000" then
                     cnt <= value;
                end if;
            end if;
        end if;
    end if;
end process;

end Behavioral;
