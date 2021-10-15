library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
  Port (clk : in std_logic;
       latch_D, ffD_d, ff_sinc_D, ff_assinc_D : in std_logic;
       ff_sinc_preset, ff_assinc_preset : in std_logic;
       ff_sinc_clear, ff_assinc_clear : in std_logic;
       latch_E : in std_logic;
       latch_Q, ff_Q, ff_sinc_Q,ff_assinc_Q : out std_logic;
       latch_Qnot,ff_Qnot, ff_sinc_Qnot, ff_assinc_Qnot : out std_logic);
end main;

architecture Behavioral of main is

component latchD 
    Port ( D : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end component;

component ff_D 
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end component;

component ff_D_reset_slr_sinc 
    Port ( Clk : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clear : in STD_LOGIC);
end component;

component ff_D_reset_slr_assinc
    Port ( D : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clear : in STD_LOGIC);
end component;

begin
    latch : latchD port map (D=>latch_D,
                             E=>latch_E,
                             Q=>latch_Q,
                             Q_not=> latch_Qnot);
                             
    ff : ff_D port map (D=>ffD_D,
                        clk=>clk,
                        Q=>ff_Q,
                        Q_not=> ff_Qnot);
                       
    ff_sinc : ff_D_reset_slr_sinc port map (D=>ff_sinc_D,
                                            Clk=>clk,
                                            Q=>ff_sinc_Q,
                                            Q_not=> ff_sinc_Qnot,
                                            preset => ff_sinc_preset,
                                            clear=> ff_sinc_clear);
                                            
    ff_assinc : ff_D_reset_slr_assinc port map (D=>ff_assinc_D,
                                                Clk=>clk,
                                                Q=>ff_assinc_Q,
                                                Q_not=> ff_assinc_Qnot,
                                                preset => ff_assinc_preset,
                                                clear=> ff_assinc_clear);

end Behavioral;