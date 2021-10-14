library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somasub is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           m : in STD_LOGIC;
           s : out STD_LOGIC;
           cout : out STD_LOGIC);
end somasub;

architecture Behavioral of somasub is

begin

s <= a xor b xor cin;
cout <= (b and cin) or ((m xor a) and (b or cin));


end Behavioral;
