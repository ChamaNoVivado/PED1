library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity calculadora is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           M : in STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           ledOF : out STD_LOGIC);
    end calculadora;

architecture Behavioral of calculadora is

    signal out_somasub, c_signal: STD_LOGIC_VECTOR (3 downto 0);
    signal out_clock : STD_LOGIC;

    component Mux_4_Disp_7S
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               C : in STD_LOGIC_VECTOR (3 downto 0);
               D : in STD_LOGIC_VECTOR (3 downto 0);
               clk_60hz : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR (7 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component somasub
        Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
               b : in STD_LOGIC_VECTOR (3 downto 0);
               op : in STD_LOGIC;
               s : out STD_LOGIC_VECTOR (3 downto 0);
               overflow : out STD_LOGIC);
    end component;
    
    component divisor_clock
        Port ( clk : in STD_LOGIC;
               clk_60hz : out STD_LOGIC);
    end component;

begin

    mux4d7s : Mux_4_Disp_7S port map (A        => A,
                                      B        => B, 
                                      C        => c_signal, 
                                      D        => out_somasub, 
                                      seg      => seg, 
                                      an       => an, 
                                      clk_60hz => out_clock);
                                      
    somasub4bits : somasub port map (a        => A,
                                     b        => B,
                                     op       => M,
                                     S        => out_somasub,
                                     overflow => ledOF);
                                     
    div_clk : divisor_clock port map (clk        => clk,
                                      clk_60hz   => out_clock);
                                      
end Behavioral;
