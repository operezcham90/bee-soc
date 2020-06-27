----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2020 01:10:14 PM
-- Design Name: 
-- Module Name: sobel_sum_squares - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sobel_sum_squares is
    Port ( g1 : in STD_LOGIC_VECTOR (31 downto 0);
        g2 : in STD_LOGIC_VECTOR (31 downto 0);
        s : out STD_LOGIC_VECTOR (31 downto 0));
end sobel_sum_squares;

architecture Behavioral of sobel_sum_squares is

signal full : STD_LOGIC_VECTOR (63 downto 0)

begin

    full <= STD_LOGIC_VECTOR(signed(g1) * signed(g1) + signed(g2) * signed(g2));
    s <= full(31 downto 0);

end Behavioral;
