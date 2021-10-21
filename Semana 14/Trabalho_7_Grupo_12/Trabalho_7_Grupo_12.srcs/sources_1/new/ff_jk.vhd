library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ff_jk is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk_counter : in STD_LOGIC;
           CLR : in STD_LOGIC;
           Q : out STD_LOGIC;
           notQ :out std_logic);
end ff_jk;

architecture Behavioral of ff_jk is

    signal s : std_logic;

begin
    process (clk_counter)
    begin
        if CLR = '1' then 
            s <= '0';
        elsif clk_counter ='1'  then 
            if ( J='0' and K ='0') then 
                s <= s;
            elsif ( J='0' and K ='1') then 
                s <= '0';
            elsif ( J='1' and K ='0') then 
                s <= '1';
            elsif ( J='1' and K ='1') then 
                s <= not s;
            end if;
        end if;
    end process;
    
    Q <= s;
    notQ<= not s;
    
end Behavioral;