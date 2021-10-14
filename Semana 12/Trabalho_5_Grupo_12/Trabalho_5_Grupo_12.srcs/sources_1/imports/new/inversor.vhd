library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inversor is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           z : out STD_LOGIC_VECTOR (3 downto 0));
end inversor;

architecture Behavioral of inversor is
begin

    z <= not a;

end Behavioral;
