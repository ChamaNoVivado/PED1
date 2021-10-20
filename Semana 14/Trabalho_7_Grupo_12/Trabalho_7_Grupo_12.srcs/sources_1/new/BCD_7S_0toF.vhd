library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCD_7S_0toF is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end BCD_7S_0toF;

architecture Behavioral of BCD_7S_0toF is
begin    
    with sw select
        seg <= "1000000" when "0000", -- '0'
               "1111001" when "0001", -- '1'
               "0100100" when "0010", -- '2'
               "0110000" when "0011", -- '3'
               "0011001" when "0100", -- '4'
               "0010010" when "0101", -- '5'
               "0000010" when "0110", -- '6'
               "1111000" when "0111", -- '7'
               "0000000" when "1000", -- '8'
               "0001100" when "1001", -- '9'
               "0001000" when "00010000", -- 'A'
               "0000000" when "00010001", -- 'B'
               "0110001" when "00010001", -- 'C'
               "1000000" when "00010011", -- 'D'
               "0110000" when "00010100", -- 'E'
               "0111000" when "00010101", -- 'F'
               "1111111" when others;
    
end Behavioral;