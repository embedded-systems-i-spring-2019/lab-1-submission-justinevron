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
           cnt : out STD_LOGIC_VECTOR (3 downto 0));
end fancy_counter;

architecture Behavioral of fancy_counter is
signal dir_reg : std_logic;
signal value : std_logic_vector(3 downto 0);
signal count : std_logic_vector(3 downto 0);
begin
cnt <= count;
process(clk)
begin
if rising_edge(clk)and en = '1' then
        if rst = '1' then
            count <= "0000";
        end if;
        if clk_en = '1' then
                if updn = '1' then
                    dir_reg <= dir;
                end if;
                if ld = '1' then
                   value <= val;
                end if;
                if dir_reg = '1' then
                    if count < value then
                        count <= STD_LOGIC_VECTOR(unsigned(count) +1);
                    else
                        count <= "0000"; 
                    end if;
   
                elsif dir_reg = '0' then
                    if count > "0000" then
                         count <= STD_LOGIC_VECTOR(unsigned(count) -1);
                    else
                         count <= value;
                    end if;
                end if;
        end if;
    end if;
end process;

end Behavioral;
