library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detectorDeOverflow is
    Port ( a3 : in STD_LOGIC;
           b3 : in STD_LOGIC;
           carry2 : in STD_LOGIC;
           overflow : out STD_LOGIC);
end detectorDeOverflow;

architecture Behavioral of detectorDeOverflow is

begin

    overflow <= '1' when (a3 and b3) /= (carry2) else '0';
    
end Behavioral;
