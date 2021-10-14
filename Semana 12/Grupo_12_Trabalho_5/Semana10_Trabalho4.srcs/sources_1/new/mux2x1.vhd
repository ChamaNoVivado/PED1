library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           seletor : in STD_LOGIC;
           outMux : out STD_LOGIC_VECTOR (3 downto 0));
end mux2x1;

architecture Behavioral of mux2x1 is
begin
    with seletor select
        outMux <= A when '0',    -- 'A'
                  B when others; -- 'B'
end Behavioral;
