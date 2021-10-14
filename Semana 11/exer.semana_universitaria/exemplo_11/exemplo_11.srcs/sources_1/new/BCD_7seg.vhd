--- decodificador BCD de 7 segmentos-----
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_7seg is
    Port ( bcd : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end BCD_7seg;

architecture Behavioral of BCD_7seg is

begin
 with bcd select
 seg <= "1111110" when"0000",
        "0110000" when"0001",
        "1101101" when"0010",
        "1111001" when"0011",
        "0110011" when"0100",
        "1011011" when"0101",
        "1011111" when"0110",
        "1110000" when"0111",
        "1111111" when"1000",
        "1111011" when"1001",
        "1111110" when others;
   


end Behavioral;
