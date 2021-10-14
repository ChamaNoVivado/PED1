library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity somadorSubtradorCompleto4bits is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC;
           Cin: in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           Overflow : out STD_LOGIC);

           
end somadorSubtradorCompleto4bits;

architecture Behavioral of somadorSubtradorCompleto4bits is
    
    signal c0, c1, c2: STD_LOGIC;
    signal BS: STD_LOGIC;

component somadorCompleto1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

component detectorDeOverflow is
    Port ( a3 : in STD_LOGIC;
           b3 : in STD_LOGIC;
           carry2 : in STD_LOGIC;
           overflow : out STD_LOGIC);
end component;

begin
    BS <= not B(3) when SEL='1';
    sum1 : somadorCompleto1bit port map (A=>A(0), B=> B(0), Cin=> Cin, S => S(0), Cout => c0 );
    sum2 : somadorCompleto1bit port map (A=>A(1), B=> B(1), Cin=> c0, S => S(1), Cout => c1 );
    sum3 : somadorCompleto1bit port map (A=>A(2), B=> B(2), Cin=> c1, S => S(2), Cout => c2 );
    sum4 : somadorCompleto1bit port map (A=>A(3), B=> BS, Cin=> c2, S => S(3), Cout => Cout );
    over : detectorDeOverflow port map (a3=>A(3), b3=>B(3), carry2=>c2, overflow=>Overflow);
    
end Behavioral;