library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

entity clock_maior is
    Port ( reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk1Hz : out STD_LOGIC);
end clock_maior;

architecture Behavioral of clock_maior is
 constant preset : std_logic_vector(25 downto 0):="11100100111000011100000000";
 signal s_1Hz: std_logic :='0';
 signal count : std_logic_vector(25 downto 0):=(others =>'0');

begin 
clk1hz <= s_1hz;

process(clk, reset) 

begin

if rising_edge(clk) then 
  if reset='1' then
     s_1Hz<='0';
     count <= (others => '0');
   elsif  count=preset then
     s_1Hz <= not s_1Hz;
     count <= (others => '0');
     else
     count <= count + '1';
    
       end if;
    end if;
  end process;
 
end Behavioral;
