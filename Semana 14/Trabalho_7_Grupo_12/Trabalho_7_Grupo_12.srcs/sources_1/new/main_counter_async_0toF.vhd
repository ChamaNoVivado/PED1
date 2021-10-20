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
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end component;



begin


end Behavioral;
