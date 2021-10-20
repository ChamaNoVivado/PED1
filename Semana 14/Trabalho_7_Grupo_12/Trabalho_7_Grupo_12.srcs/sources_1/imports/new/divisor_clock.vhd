library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity divisor_clock is
    Port ( CLR : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end divisor_clock;

architecture Behavioral of divisor_clock is
    
    constant preset : std_logic_vector(26 downto 0):="010111110101111000010000000";
    signal s_1hz: std_logic :='0';
    signal count : std_logic_vector(26 downto 0):=(others =>'0');
    
begin 
    
    clk_1hz <= s_1hz;

    process(clk, CLR)
    begin
        if CLR = '1' then
            s_1hz <= '0';
            count <= (others => '0');
        elsif falling_edge(clk) then 
            if  count = preset then
                s_1hz <= not s_1hz;
                count <= (others => '0');
            else
                count <= count + '1';
            end if;
        end if;
    end process;
 
end Behavioral;