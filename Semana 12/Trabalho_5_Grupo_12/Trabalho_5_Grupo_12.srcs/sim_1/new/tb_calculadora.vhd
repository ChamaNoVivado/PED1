library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;

entity tb_calculadora is
--  Port ( );
end tb_calculadora;

architecture Behavioral of tb_calculadora is

    component calculadora
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               clk : in STD_LOGIC;
               M : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR (7 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0);
               ledOF : out STD_LOGIC);
    end component;
    
    signal teste_A, teste_B, teste_s, teste_an: STD_LOGIC_VECTOR (3 downto 0);
    signal teste_M, teste_ledOF, teste_clk : STD_LOGIC;
    signal teste_seg : STD_LOGIC_VECTOR (7 downto 0);
    
begin

    UUT: calculadora port map (A          => teste_A, 
                               B          => teste_B, 
                               clk        => teste_clk, 
                               M          => teste_M, 
                               seg        => teste_seg,
                               an         => teste_an,
                               ledOF      => teste_ledOF);

process begin

    -- Caso 2
    teste_M <= '0'; -- soma
    teste_A <= "0110"; -- 6
    teste_B <= "0110"; -- 5
    wait for 100ns;
    
    
    -- Caso 3
    teste_M <= '0'; -- soma
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    
    -- Caso 8
    teste_M <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "0011"; -- 3
    wait for 100ns;
    
    -- Caso 11
    teste_M <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "1010"; -- -6
    wait for 100ns;
 
    -- Caso 12
    teste_M <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "0011"; -- 3 
    wait for 100ns;
    
    -- Caso 15
    teste_M <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    
    
    -- Caso 18
    teste_M <= '1'; -- subtracao
    teste_A <= "1010"; -- -6
    teste_B <= "0111"; -- 7
    wait for 100ns;
    
end process;

end Behavioral;
