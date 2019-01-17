library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity decoder_bcd is

    port ( --enable: IN std_logic;
	        decena: IN unsigned(3 downto 0);
			  unidad: IN unsigned(3 downto 0);
			  centena: IN unsigned(3 downto 0);
			  binario: OUT unsigned(7 downto 0));
			  
end decoder_bcd;

Architecture solucion of decoder_bcd is
	  signal var1: unsigned(5 downto 0);
	  signal var2: unsigned(8 downto 0);
	  signal var3: unsigned(6 downto 0);
	  signal var6: unsigned(5 downto 0);
	  signal var4: unsigned(8 downto 0);
	  signal var5: unsigned(9 downto 0);
	  signal var7: unsigned(9 downto 0);
    begin 
	  
	  var1<= decena*"10";
	  var2<= ('0'&decena(3)&decena(2)&decena(1)&decena(0)&"000")+("000"&(var1+unidad));
	  var3<= centena*"100";
	  var6<= centena*"10";
	  var4<= var2+('0'&var3);
	  var5<= (var6&"0000")+var4;
	  var7<= (centena(1)&centena(0)&"000000")+var5;
	  
	  binario<= var7(7 downto 0);
	  
end solucion;