library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display7Segmentos_DP_C2 is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (7 downto 0));
end display7Segmentos_DP_C2;

architecture Behavioral of display7Segmentos_DP_C2 is
begin    
    with sw select
        seg <= "11000000" when "0000", -- '+0'
               "11111001" when "0001", -- '+1'
               "10100100" when "0010", -- '+2'
               "10110000" when "0011", -- '+3'
               "10011001" when "0100", -- '+4'
               "10010010" when "0101", -- '+5'
               "10000010" when "0110", -- '+6'
               "11111000" when "0111", -- '+7'
               "00000000" when "1000", -- '-8'
               "01111000" when "1001", -- '-7'
               "00000010" when "1010", -- '-6'
               "00010010" when "1011", -- '-5'
               "00011001" when "1100", -- '-4'
               "00110000" when "1101", -- '-3'
               "00100100" when "1110", -- '-2'
               "01111001" when others; -- '-1'
    
end Behavioral;
