----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2020 12:36:58 PM
-- Design Name: 
-- Module Name: sobel_convolution - Behavioral
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

entity sobel_convolution is
    Port ( a1 : in STD_LOGIC_VECTOR (31 downto 0);
        a2 : in STD_LOGIC_VECTOR (31 downto 0);
        a3 : in STD_LOGIC_VECTOR (31 downto 0);
        a4 : in STD_LOGIC_VECTOR (31 downto 0);
        a5 : in STD_LOGIC_VECTOR (31 downto 0);
        a6 : in STD_LOGIC_VECTOR (31 downto 0);
        g : out STD_LOGIC_VECTOR (31 downto 0));
end sobel_convolution;

architecture Behavioral of sobel_convolution is

begin
    
    g <= STD_LOGIC_VECTOR(signed(a4) + 
    signed(a5) + 
    signed(a5) + 
    signed(a6) -
    signed(a1) -
    signed(a2) - 
    signed(a2) -
    signed(a3));

end Behavioral;
