
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux4X1 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           S : out STD_LOGIC);
end mux4X1;

architecture Behavioral of mux4X1 is

begin

S<= (not(Sel(0)) and not (Sel(1))and A) or  --- sel = 00 S=A 
    (not(Sel(0)) and not (Sel(1))and B) or  --- sel = 01 S=B 
    (not(Sel(0)) and not (Sel(1))and C) or  --- sel = 10 S=C
    ((Sel(0)) and not (Sel(1))and D);       --- sel = 11 S=D
end Behavioral;
