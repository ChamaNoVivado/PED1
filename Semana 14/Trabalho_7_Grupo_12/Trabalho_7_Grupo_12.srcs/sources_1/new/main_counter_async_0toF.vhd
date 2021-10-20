library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_counter_async_0toF is
    Port ( clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Rst : in STD_LOGIC;
           led : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0));
end main_counter_async_0toF;

architecture Behavioral of main_counter_async_0toF is

component BCD_7S_0toF is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component divisor_clock is
    Port ( CLR : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end component;

    signal clk_1hz_signal : STD_LOGIC;
    signal clk_and_En : STD_LOGIC;
    signal sA, sB, sC, sD : STD_LOGIC;

begin

    clock: divisor_clock port map (CLR => Rst, clk => clk, clk_1hz => clk_1hz_signal);
    
    ff00: flipfrops port map (J => 1, K => 1, Q => sA,  clk_dividido => clk_1hz_signal,  CLR => Rst);
    ff01: flipfrops port map (J => 1, K => 1, Q => sB,  clk_dividido => clk_1hz_signal,  CLR => Rst);
    ff02: flipfrops port map (J => 1, K => 1, Q => sC,  clk_dividido => clk_1hz_signal,  CLR => Rst);
    ff03: flipfrops port map (J => 1, K => 1, Q => sD,  clk_dividido => clk_1hz_signal,  CLR => Rst);

end Behavioral;
