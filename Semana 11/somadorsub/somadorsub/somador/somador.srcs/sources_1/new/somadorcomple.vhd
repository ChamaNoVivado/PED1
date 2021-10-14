library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somadorcomple is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin :STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC_VECTOR (3 downto 0));
end somadorcomple;

architecture Behavioral of somadorcomple is

begin
S<= A XOR (B XOR Cin);
Cout <=
end Behavioral;
