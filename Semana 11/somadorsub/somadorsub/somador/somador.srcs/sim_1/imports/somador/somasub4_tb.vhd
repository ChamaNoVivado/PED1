library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somasub4_tb is
end somasub4_tb;

architecture Behavioral of somasub4_tb is

component somasub4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           M : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : inout STD_LOGIC);
end component;

    signal teste_A, teste_B, teste_S : STD_LOGIC_VECTOR (3 downto 0);
    signal teste_M, teste_Cin, teste_Cout: STD_LOGIC;

begin

    UUTt: somasub4 port map (A=>teste_A, B=>teste_B, Cin=>teste_Cin, S=>teste_S, Cout=>teste_Cout, M=>teste_M);

process begin

    -- Caso 2
    teste_M <= '0'; -- soma
    teste_A <= "0110"; -- 6
    teste_B <= "0110"; -- 5
    wait for 100ns;
    assert (teste_S="1011") report "Caso 2: 6 + 5 ? 6 Overflow (1011" severity ERROR;
    
    -- Caso 3
    teste_M <= '0'; -- soma
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    assert (teste_S="0011") report "Caso 3: 5 + -2 ? 3 (0011)" severity ERROR;
  
    -- Caso 8
    teste_M <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "0011"; -- 3
    wait for 100ns;
    assert (teste_S="1110") report "Caso 8: -5 + 3 ? -2 (1110)" severity ERROR;
    
    -- Caso 11
    teste_M <= '0'; -- soma
    teste_A <= "1011"; -- -5
    teste_B <= "1010"; -- -6
    wait for 100ns;
    assert (teste_S="0101") report "Caso 11: -5 + -6 ? 5 Overflow(1011) Overflow" severity ERROR;    
    
    -- Caso 12
    teste_M <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "0011"; -- 3 
    wait for 100ns;
    assert (teste_S="0010") report "Caso 12: 5 - 3 ? 2 (1011)" severity ERROR;
    
    -- Caso 15
    teste_M <= '1'; -- subtracao
    teste_A <= "0101"; -- 5
    teste_B <= "1110"; -- -2
    wait for 100ns;
    assert (teste_S="0111") report "Caso 15: 5 - -2 ? 7 (1011)" severity ERROR;
    
    -- Caso 18
    teste_M <= '1'; -- subtracao
    teste_A <= "1010"; -- -6
    teste_B <= "0111"; -- 7
    wait for 100ns;
    assert (teste_S="0011") report "Caso 18: -6 - 7 ? 3 Overflow (1011)" severity ERROR;            
    
end process;

end Behavioral;
