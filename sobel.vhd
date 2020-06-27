----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/26/2020 04:10:16 PM
-- Design Name: 
-- Module Name: sobel - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sobel is
    Port ( g1 : in STD_LOGIC_VECTOR (31 downto 0);
           g2 : in STD_LOGIC_VECTOR (31 downto 0);
           s : out STD_LOGIC_VECTOR (31 downto 0));
end sobel;

architecture Behavioral of sobel is

begin

    s <= STD_LOGIC_VECTOR(signed(g1) * signed(g1) + signed(g2) * signed(g2));

end Behavioral;
