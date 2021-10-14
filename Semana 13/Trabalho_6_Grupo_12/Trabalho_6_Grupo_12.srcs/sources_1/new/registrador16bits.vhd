----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.10.2021 19:55:18
-- Design Name: 
-- Module Name: registrador16bits - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registrador16bits is
    Port ( clk : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (1 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end registrador16bits;

architecture Behavioral of registrador16bits is

begin


end Behavioral;
