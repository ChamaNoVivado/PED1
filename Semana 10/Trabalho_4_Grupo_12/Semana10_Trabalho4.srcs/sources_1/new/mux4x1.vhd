library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4x1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           seletor : in STD_LOGIC_VECTOR (3 downto 0);
           outMux : out STD_LOGIC_VECTOR (3 downto 0));
end mux4x1;

architecture Behavioral of mux4x1 is
begin
    with seletor select
        outMux <= A when "0111", -- 'A'
                  B when "1011", -- 'B'
                  C when "1101", -- 'C'
                  D when others; -- 'D'
                 
end Behavioral;
