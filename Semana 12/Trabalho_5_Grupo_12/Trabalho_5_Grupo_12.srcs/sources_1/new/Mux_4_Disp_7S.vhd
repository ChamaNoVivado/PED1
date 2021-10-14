library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_4_Disp_7S is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           clk_60hz : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_4_Disp_7S;

architecture Behavioral of Mux_4_Disp_7S is

    signal sw, an_sel : STD_LOGIC_VECTOR (3 downto 0);
    
    component logica_de_selecao
        Port ( clk_60hz : in STD_LOGIC;
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component mux4x1
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               C : in STD_LOGIC_VECTOR (3 downto 0);
               D : in STD_LOGIC_VECTOR (3 downto 0);
               seletor : in STD_LOGIC_VECTOR (3 downto 0);
               outMux : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component display7Segmentos_DP_C2
        Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
               seg : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
begin

    mux : mux4x1 port map (A=>A, B=>B, C=>C, D=>D, seletor=>an_sel, outMux=>sw);
    display : display7Segmentos_DP_C2 port map (sw=>sw, seg=>seg);
    logica : logica_de_selecao port map (an=>an_sel, clk_60hz=>clk_60hz);
    
    an <= an_sel; 
    
end Behavioral;