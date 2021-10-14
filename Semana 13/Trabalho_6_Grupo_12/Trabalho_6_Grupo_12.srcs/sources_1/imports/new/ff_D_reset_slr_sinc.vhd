library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_D_reset_slr_sinc is
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           clear : in STD_LOGIC);
end ff_D_reset_slr_sinc;

architecture Behavioral of ff_D_reset_slr_sinc is

    signal qt : std_logic;

begin

    Q <= qt;

ffD: process(clk)
begin
    if falling_edge(clk) then  -- rising edge-> se o elemento der uma borda de subida, ele volta um , caso contrario volta 0.
        if clear ='1' then
            qt <= '0';
        else 
            qt <= D;               -- folwind edge -> caso ocarra o contrario
        end if;
    end if;
 end process;
 end Behavioral;