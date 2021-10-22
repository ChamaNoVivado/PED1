library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main_counter_async_0toF is
    Port ( clk : in STD_LOGIC;
           En : in STD_LOGIC;
           Rst : in STD_LOGIC;
           led : out STD_LOGIC;
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0):= "1110");
           -- an: mantem somente o primeiro painel BCD ligado
end main_counter_async_0toF;

architecture Behavioral of main_counter_async_0toF is

component BCD_7S_0toF is
    Port ( sw : in STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component divisor_clock is
    Port ( CLR : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end component;

component ff_jk is
    Port ( J, K, CLR : in STD_LOGIC;
           clk_counter : in STD_LOGIC;
           Q, notQ: out STD_LOGIC);
end component;

    signal clk_1hz_signal : STD_LOGIC;
    signal habilitador : STD_LOGIC;
--  signal sA, sB, sC, sD : STD_LOGIC;
    signal notA, notB, notC, notD : STD_LOGIC;

begin

    clock : divisor_clock port map (CLR => Rst, clk => clk, clk_1hz => clk_1hz_signal);
    -- Recebe clock de 100Mhz da Basys3 e retorna 1hz
    
    habilitador <= not(clk_1hz_signal AND En);
    -- habilita a passagem de clock quando a entrada En está em 1
    
    ffA : ff_jk port map (J=>'1',K=>'1', clk_counter => habilitador, CLR => Rst, notQ => notA);
    ffB : ff_jk port map (J=>'1',K=>'1', clk_counter => notA,        CLR => Rst, notQ => notB);
    ffC : ff_jk port map (J=>'1',K=>'1', clk_counter => notB,        CLR => Rst, notQ => notC);
    ffD : ff_jk port map (J=>'1',K=>'1', clk_counter => notC,        CLR => Rst, notQ => notD);
    -- Conta de acordo com a entrada de clock recebida do habilitador, usando FF JK em modo T
    
    display :  BCD_7S_0toF port map (sw(0) => notA, sw(1) => notB, sw(2) => notC, sw(3) => notD, seg => seg);
    -- Mostra os valores do contador no painel BCD
    
    led <= (notA AND notB AND notC AND notD); 
    -- Led que indica o final da contagem 

end Behavioral;
