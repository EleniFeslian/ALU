----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.12.2020 23:56:25
-- Design Name: 
-- Module Name: ALU - beh_ALU
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

entity ALU is
  Port ( a: in std_logic_vector (3 downto 0);
         b: in std_logic_vector (3 downto 0);
         Ctr: in std_logic_vector (1 downto 0);
         Result: out std_logic_vector (3 downto 0);
         OVF: out std_logic
         );
end ALU;

architecture beh_ALU of ALU is
-- signal for solution without process
--signal res_temp: signed (4 downto 0);
begin
----------------------------------------------------------------
--WITHOUT PROCESS

--res_temp<=signed('0'&a) + signed('0'&b) when Ctr="00"
--          else signed(a&'0') when Ctr="10"
--          else signed('0'&a)-signed('0'&b) when Ctr="01"
--          else signed('0'&a) and signed('0'&b) when Ctr="11"
--          else resize("X",res_temp'length)
--          ;
--Result<= std_logic_vector(res_temp(3 downto 0));
--OVF<=res_temp(4);
          
----------------------------------------------------------------

----WITH PROCESS

type_pro: process (a,b,Ctr) is   

variable res_temp : signed (4 downto 0); 

begin

if Ctr="00" then
     res_temp:= signed('0'&a) + signed('0'&b); 
elsif Ctr="01" then
     res_temp:= signed(a&'0');
elsif Ctr="10" then
     res_temp:= signed('0'&a) - signed('0'&b);
elsif Ctr="11" then
     res_temp:= signed('0'&a) and signed('0'&b);
else
     res_temp:= resize("X",res_temp'length);
end if;

Result<= std_logic_vector(res_temp(3 downto 0));

OVF<=res_temp(4);

end process type_pro;

end beh_ALU;
