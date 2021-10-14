library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logica_de_selecao is
    Port ( seletor : in STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end logica_de_selecao;

architecture Behavioral of logica_de_selecao is
begin
    
    with seletor select
        an <= "0111" when "0111",  -- 'A'
              "1011" when "1011",  -- 'B'
              "1101" when "1101",  -- 'C'    
              "1110" when "1110",  -- 'D'
              "1111" when others;  -- Apagado
                  
end Behavioral;
