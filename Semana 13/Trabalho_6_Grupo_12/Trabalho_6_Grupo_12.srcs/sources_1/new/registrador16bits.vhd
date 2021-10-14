library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registrador16bits is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end registrador16bits;

architecture Behavioral of registrador16bits is

component ff_D_reset_slr_sinc 
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           clear : in STD_LOGIC);
end component;

component divisor_clock
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end component;

    signal q_signal : STD_LOGIC_VECTOR (15 downto 0);
    signal clk_1hz : STD_LOGIC;

begin

    led <= q_signal;
    clock: divisor_clock port map (reset => sw(1), clk => clk, clk_1hz => clk_1hz);
    ff00: ff_D_reset_slr_sinc port map (D => sw(0), Clk => clk, Q => q_signal(0), clear => sw(1));
    ff01: ff_D_reset_slr_sinc port map (D => q_signal(0), Clk => clk_1hz, Q => q_signal(1), clear => sw(1));
    ff02: ff_D_reset_slr_sinc port map (D => q_signal(1), Clk => clk_1hz, Q => q_signal(2), clear => sw(1));
    ff03: ff_D_reset_slr_sinc port map (D => q_signal(2), Clk => clk_1hz, Q => q_signal(3), clear => sw(1));
    ff04: ff_D_reset_slr_sinc port map (D => q_signal(3), Clk => clk_1hz, Q => q_signal(4), clear => sw(1));
    ff05: ff_D_reset_slr_sinc port map (D => q_signal(4), Clk => clk_1hz, Q => q_signal(5), clear => sw(1));
    ff06: ff_D_reset_slr_sinc port map (D => q_signal(5), Clk => clk_1hz, Q => q_signal(6), clear => sw(1));
    ff07: ff_D_reset_slr_sinc port map (D => q_signal(6), Clk => clk_1hz, Q => q_signal(7), clear => sw(1));
    ff08: ff_D_reset_slr_sinc port map (D => q_signal(7), Clk => clk_1hz, Q => q_signal(8), clear => sw(1));
    ff09: ff_D_reset_slr_sinc port map (D => q_signal(8), Clk => clk_1hz, Q => q_signal(9), clear => sw(1));
    ff10: ff_D_reset_slr_sinc port map (D => q_signal(9), Clk => clk_1hz, Q => q_signal(10), clear => sw(1));
    ff11: ff_D_reset_slr_sinc port map (D => q_signal(10), Clk => clk_1hz, Q => q_signal(11), clear => sw(1));
    ff12: ff_D_reset_slr_sinc port map (D => q_signal(11), Clk => clk_1hz, Q => q_signal(12), clear => sw(1));
    ff13: ff_D_reset_slr_sinc port map (D => q_signal(12), Clk => clk_1hz, Q => q_signal(13), clear => sw(1));
    ff14: ff_D_reset_slr_sinc port map (D => q_signal(13), Clk => clk_1hz, Q => q_signal(14), clear => sw(1));
    ff15: ff_D_reset_slr_sinc port map (D => q_signal(14), Clk => clk_1hz, Q => q_signal(15), clear => sw(1));
                                            
end Behavioral;