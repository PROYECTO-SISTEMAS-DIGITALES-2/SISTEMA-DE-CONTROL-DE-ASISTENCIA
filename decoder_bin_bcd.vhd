library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity decoder_bin_bcd is
    port ( enable: IN std_logic;
			  datos: IN unsigned(7 downto 0);
			  bcd: OUT unsigned(7 downto 0));
			  
end decoder_bin_bcd;


Architecture solucion of decoder_bin_bcd is
   
	  signal var1: unsigned(7 downto 0);
	  begin 
	  
	  var1<=(datos/"1010");
	  bcd<=( datos mod "00001010")+(var1(3)&var1(2)&var1(1)&var1(0)&"0000") when enable='1' else "11111111";
	  
	  
end solucion;