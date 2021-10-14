----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2021 14:13:56
-- Design Name: 
-- Module Name: tb_somasub - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_somasub is
--  Port ( );
end tb_somasub;

architecture Behavioral of tb_somasub is

component somasub 
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           op : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (3 downto 0);
           overflow : out STD_LOGIC);
end component;

 

signal teste_A, teste_B, teste_s: STD_LOGIC_VECTOR (3 downto 0);
signal teste_op, teste_overflow: std_logic;
begin
uut: somasub port map (A=>teste_A, B=>teste_B, S=>teste_S, op=>teste_op, overflow =>teste_overflow);

process begin

    -- Caso 2
    teste_op <= '0'; -- soma
    teste_A <= "0110"; -- 6
    teste_B <= "0110"; -- 5
    wait for 100ns;
    
    
    -- Caso 3
    teste_op <= '0'; -- soma
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    
    -- Caso 8
    teste_op <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "0011"; -- 3
    wait for 100ns;
    
    -- Caso 11
    teste_op <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "1010"; -- -6
    wait for 100ns;
 
    -- Caso 12
    teste_op <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "0011"; -- 3 
    wait for 100ns;
    
    -- Caso 15
    teste_op <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    
    
    -- Caso 18
    teste_op <= '1'; -- subtracao
    teste_A <= "1010"; -- -6
    teste_B <= "0111"; -- 7
    wait for 100ns;
    
end process;

end Behavioral;