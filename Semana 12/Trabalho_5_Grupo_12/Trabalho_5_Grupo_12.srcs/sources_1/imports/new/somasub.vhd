library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somasub is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           op : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC);
end somasub;

architecture Behavioral of somasub is
    component inversor 
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               z : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component mux2x1
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component somador4
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               cin : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0);
               overflow : out STD_LOGIC);
    end component;
    
    signal f1, f2 : std_logic_vector(3 downto 0);
    
begin

    inver: inversor port map (a=>b, z=>f1);
    muxple: mux2x1 port map (a=>b, s=>f2, b=>f1, sel => op);
    soma: somador4 port map (cin=> op, a=>a, overflow => overflow, s=>s, b=>f2);
    
end Behavioral;
