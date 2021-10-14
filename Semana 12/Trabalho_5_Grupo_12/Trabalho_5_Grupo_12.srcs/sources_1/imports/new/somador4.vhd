library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned;

entity somador4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC);
end somador4;

architecture Behavioral of somador4 is
    
    COMPONENT somador 
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               S : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end COMPONENT;

    SIGNAL c0, c1, c2, c3 : std_logic;
    
begin

    b0: somador port map ( a=> A(0), b=> B(0), cin=> Cin, s=> S(0), Cout => c0);
    b1: somador port map ( a=> A(1), b=> B(1), cin=> c0, s=> S(1), Cout => c1);
    b2: somador port map ( a=> A(2), b=> B(2), cin=> c1, s=> S(2), Cout => c2);
    b3: somador port map ( a=> A(3), b=> B(3), cin=> c2, s=> S(3), Cout => c3);
    
    overflow <= c2 xor c3;
    
end Behavioral;
