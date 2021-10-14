library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end somador;

architecture Behavioral of somador is

begin

    S <= (A xor B xor Cin);
    Cout <= (A and B) or (A and Cin) or (b and Cin);
    
end Behavioral;
