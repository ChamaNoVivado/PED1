library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_tb is
end main_tb;

architecture Behavioral of main_tb is

    component main
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               seletor : in STD_LOGIC;
               seg : out STD_LOGIC_VECTOR (6 downto 0);
               an : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal teste_A, teste_B, teste_an : STD_LOGIC_VECTOR (3 downto 0);
    signal teste_seletor: STD_LOGIC;
    signal teste_seg : STD_LOGIC_VECTOR (6 downto 0);
    
begin

    UUT: main port map (A       => teste_A, 
                        B       => teste_B, 
                        seletor => teste_seletor, 
                        seg     => teste_seg, 
                        an      => teste_an);

process
begin
    teste_seletor <= '0';
    teste_A <= "0000";
    wait for 100ns;
    assert (teste_seg="1000000") report "teste A0 not 1000000 (0)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "0001";
    wait for 100ns;
    assert (teste_seg="1111001") report "teste B1 not 1111001 (1)" severity ERROR;     
  
    teste_seletor <= '0';
    teste_A <= "0010";
    wait for 100ns;
    assert (teste_seg="0100100") report "teste A2 not 0100100 (2)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "0011";
    wait for 100ns;
    assert (teste_seg="0110000") report "teste B3 not 0110000 (3)" severity ERROR;    
    
    teste_seletor <= '0';   
    teste_A <= "0100";
    wait for 100ns;
    assert (teste_seg="0011001") report "teste A4 not 0011001 (4)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "0101";
    wait for 100ns;
    assert (teste_seg="0010010") report "teste B5 not 0000010 (5)" severity ERROR;    
    
    teste_seletor <= '0';
    teste_A <= "0110";
    wait for 100ns;
    assert (teste_seg="0000010") report "teste A6 not 1111000 (6)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "0111";
    wait for 100ns;
    assert (teste_seg="1111000") report "teste B7 not 1110001 (7)" severity ERROR;    
    
    teste_seletor <= '0';
    teste_A <= "1000";
    wait for 100ns;
    assert (teste_seg="0000000") report "teste A8 not 0000000 (8)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "1001";
    wait for 100ns;
    assert (teste_seg="0010000") report "teste B9 not 0010000 (9)" severity ERROR;    
    
    teste_seletor <= '0';
    teste_A <= "1010";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste A10 not 1111111 (A OFF)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "1011";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste B11 not 1111111 (B OFF)" severity ERROR;    
    
    teste_seletor <= '0';
    teste_A <= "1100";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste A12 not 1111111 (C OFF)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "1101";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste B13 not 1111111 (D OFF)" severity ERROR;
    
    teste_seletor <= '0';
    teste_A <= "1110";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste A14 not 1111111 (E OFF)" severity ERROR;
    
    teste_seletor <= '1';
    teste_B <= "1111";
    wait for 100ns;
    assert (teste_seg="1111111") report "teste B15 not 1111111 (F OFF)" severity ERROR;    
end process;

end Behavioral;