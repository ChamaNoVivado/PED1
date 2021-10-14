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

begin

    ff_sinc: ff_D_reset_slr_sinc  port map (D     => sw(0),
                                            Clk   => clk,
                                            Q     => ,
                                            clear => sw(1));
end Behavioral;