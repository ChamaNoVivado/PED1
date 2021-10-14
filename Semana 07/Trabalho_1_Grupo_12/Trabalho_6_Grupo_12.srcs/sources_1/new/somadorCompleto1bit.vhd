library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somadorCompleto1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end somadorCompleto1bit;

architecture Behavioral of somadorCompleto1bit is

begin

S <= A xor B xor Cin;
Cout <= (a and b) or (a and Cin) or (b and Cin);

end Behavioral;