library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registrador16bits is
    Port ( clk : in STD_LOGIC;
           clear : in STD_LOGIC;
           entrada : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end registrador16bits;

architecture Behavioral of registrador16bits is

component ff_D_reset
    Port ( clk_dividido : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           reset : in STD_LOGIC);
end component;

component divisor_clock
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end component;

    signal saida : STD_LOGIC_VECTOR (15 downto 0);
    signal clk_1hz_signal : STD_LOGIC;

begin

    led <= saida;

    clock: divisor_clock port map (reset => clear, clk => clk, clk_1hz => clk_1hz_signal);
    
    ff00: ff_D_reset port map (D => entrada,   clk_dividido => clk_1hz_signal, Q => saida(0),  reset => clear);
    ff01: ff_D_reset port map (D => saida(0),  clk_dividido => clk_1hz_signal, Q => saida(1),  reset => clear);
    ff02: ff_D_reset port map (D => saida(1),  clk_dividido => clk_1hz_signal, Q => saida(2),  reset => clear);
    ff03: ff_D_reset port map (D => saida(2),  clk_dividido => clk_1hz_signal, Q => saida(3),  reset => clear);
    ff04: ff_D_reset port map (D => saida(3),  clk_dividido => clk_1hz_signal, Q => saida(4),  reset => clear);
    ff05: ff_D_reset port map (D => saida(4),  clk_dividido => clk_1hz_signal, Q => saida(5),  reset => clear);
    ff06: ff_D_reset port map (D => saida(5),  clk_dividido => clk_1hz_signal, Q => saida(6),  reset => clear);
    ff07: ff_D_reset port map (D => saida(6),  clk_dividido => clk_1hz_signal, Q => saida(7),  reset => clear);
    ff08: ff_D_reset port map (D => saida(7),  clk_dividido => clk_1hz_signal, Q => saida(8),  reset => clear);
    ff09: ff_D_reset port map (D => saida(8),  clk_dividido => clk_1hz_signal, Q => saida(9),  reset => clear);
    ff10: ff_D_reset port map (D => saida(9),  clk_dividido => clk_1hz_signal, Q => saida(10), reset => clear);
    ff11: ff_D_reset port map (D => saida(10), clk_dividido => clk_1hz_signal, Q => saida(11), reset => clear);
    ff12: ff_D_reset port map (D => saida(11), clk_dividido => clk_1hz_signal, Q => saida(12), reset => clear);
    ff13: ff_D_reset port map (D => saida(12), clk_dividido => clk_1hz_signal, Q => saida(13), reset => clear);
    ff14: ff_D_reset port map (D => saida(13), clk_dividido => clk_1hz_signal, Q => saida(14), reset => clear);
    ff15: ff_D_reset port map (D => saida(14), clk_dividido => clk_1hz_signal, Q => saida(15), reset => clear);
                                            
end Behavioral;