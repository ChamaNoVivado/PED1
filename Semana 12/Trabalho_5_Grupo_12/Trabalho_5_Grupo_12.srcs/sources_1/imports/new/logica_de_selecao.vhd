library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logica_de_selecao is
    Port ( clk_60hz : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0));
end logica_de_selecao;

architecture Behavioral of logica_de_selecao is
    
    signal seletor_display : integer range 1 to 4:=1; 
    
begin

    process (clk_60hz)
    begin
        if rising_edge(clk_60hz) then 
            case seletor_display is
                when 1 => an <= "0111"; 
                when 2 => an <= "1011";
                when 3 => an <= "1101";
                when 4 => an <= "1110";
            end case;
            
            seletor_display <= seletor_display + 1;
        end if;
    end process;
    
--    with clk_60hz select
--        an <= "0111" when "0",  -- 'A'
--              "1011" when "0",  -- 'B'
--              "1101" when "00000000000000000000000010",  -- 'C'    
--              "1110" when "00000000000000000000000011",  -- 'D'
--              "1111" when others;  -- Apagado
                  
end Behavioral;
