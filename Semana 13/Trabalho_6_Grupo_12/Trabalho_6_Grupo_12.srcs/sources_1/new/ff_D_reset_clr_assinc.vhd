library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_D_reset_clr_assinc is
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           reset : in STD_LOGIC);
end ff_D_reset_clr_assinc;

architecture Behavioral of ff_D_reset_clr_assinc is

    signal qt : std_logic;
    
begin

    Q <= qt;
    
    ffD: process(clk,reset)
    begin
        if reset= '1' then
            qt <= '0';
        elsif falling_edge(clk) then
            qt <= D;
        end if;
    end process;
end Behavioral;
