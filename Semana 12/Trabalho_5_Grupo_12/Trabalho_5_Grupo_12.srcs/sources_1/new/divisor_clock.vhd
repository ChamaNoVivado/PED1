library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity divisor_clock is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_60hz : out STD_LOGIC);
end divisor_clock;

architecture Behavioral of divisor_clock is
    
    constant preset : std_logic_vector(25 downto 0):="11100100111000011100000000";
    signal s_60hz: std_logic :='0';
    signal count : std_logic_vector(25 downto 0):=(others =>'0');
    
begin 
    
    clk_60hz <= s_60hz;

process(clk, reset) 

begin

if rising_edge(clk) then 
    if reset='1' then
         s_60hz <= '0';
         count <= (others => '0');
         elsif  count=preset then
              s_60hz <= not s_60hz;
              count <= (others => '0');
         else
              count <= count + '1';
        
        end if;
    end if;
    end process;
 
end Behavioral;