library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somasub4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : inout STD_LOGIC);
end somasub4;

architecture Behavioral of somasub4 is

    signal c0,c1,c2: std_logic;

    component somasub
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               m : in STD_LOGIC;
               cin : in STD_LOGIC;
               s : out STD_LOGIC; 
               cout : inout STD_LOGIC);
    end component;
    
begin



somasub1: somasub port map (a=>A(0), b=>B(0), cin=>Cin, s=>S(0), m=>M);
somasub2: somasub port map (a=>A(1), b=>B(1), cin=>c1, s=>S(1), cout=>c0, m=>M);
somasub3: somasub port map (a=>A(2), b=>B(2), cin=>c2, s=>S(2), cout=>c1, m=>M);
somasub4: somasub port map (a=>A(3), b=>B(3), cin=>Cin, s=>S(3), cout=>c2, m=>M);

end Behavioral;
