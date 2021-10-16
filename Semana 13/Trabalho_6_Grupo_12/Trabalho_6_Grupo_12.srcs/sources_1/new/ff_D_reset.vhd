library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_D_reset is
    Port ( D : in STD_LOGIC;
           clk_dividido : in STD_LOGIC;
           Q : out STD_LOGIC;
           reset : in STD_LOGIC);
end ff_D_reset;

architecture Behavioral of ff_D_reset is

    signal qt : std_logic;
    
begin

    Q <= qt;

    ffD:
    process(clk_dividido,reset)
    begin
        if (reset = '1') then
            qt <= '0';
        elsif (falling_edge(clk_dividido)) then
            case (D) is
                when '1' => qt <= '1';
                when '0' => qt <= '0';
                when others => null;
            end case;
        end if;
    end process;
    
end Behavioral;
