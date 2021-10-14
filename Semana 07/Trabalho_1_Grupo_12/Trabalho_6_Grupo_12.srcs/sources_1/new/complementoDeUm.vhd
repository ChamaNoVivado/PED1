library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity complementoDeUm is
    Port ( num : in STD_LOGIC_VECTOR (3 downto 0);
           C1 : out STD_LOGIC_VECTOR (3 downto 0));
end complementoDeUm;

architecture Behavioral of complementoDeUm is

begin

 C1 <= not num;

end Behavioral;
