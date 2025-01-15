----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2020 19:44:55
-- Design Name: 
-- Module Name: ALU_tb - beh_ALU_tb
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

entity ALU_tb is
-- Port();
end ALU_tb;

architecture beh_ALU_tb of ALU_tb is

component ALU is
  Port ( a: in std_logic_vector (3 downto 0);
         b: in std_logic_vector (3 downto 0);
         Ctr: in std_logic_vector (1 downto 0);
         Result: out std_logic_vector (3 downto 0);
         OVF: out std_logic
         );
end component ALU;

signal a_tb      : std_logic_vector (3 downto 0);  
signal b_tb      : std_logic_vector(3 downto 0); 
signal Ctr_tb    : std_logic_vector(1 downto 0);                     
signal Result_tb : std_logic_vector (3 downto 0);
signal OVF_tb  : STD_LOGIC;  

begin

uut: ALU port map ( a=>a_tb,
                    b=>b_tb,
                    Ctr=>Ctr_tb,
                    Result=>Result_tb, 
                    OVF=>OVF_tb
                    );
                    
test: process is

begin

Ctr_tb<="00"; 
a_tb<="0010";b_tb<="0010";wait for 20 ns;
a_tb<="1000";b_tb<="1000";wait for 20 ns;
--to check every possible solution, same in other cases of 'Ctr'
--for i in -8  to 7 loop
--    a_tb<=std_logic_vector(i,a_tb'length);
--    for j in -8 to 7 loop
--        b_tb<=std_logic_vector(j,a_tb'length);wait for 20ns;
--    end loop j;
--end loop i;    


Ctr_tb<="01";
a_tb<="0001";wait for 20 ns;
a_tb<="1001";wait for 20 ns; 

Ctr_tb<="10";
a_tb<="0010";b_tb<="0010";wait for 20 ns;
a_tb<="1011";b_tb<="0001";wait for 20 ns;

Ctr_tb<="11";
a_tb<="0001";b_tb<="0001";wait for 20 ns;
a_tb<="0000";b_tb<="0101";wait for 20 ns;

end process test;

end beh_ALU_tb;