library ieee;
use ieee.std_logic_1164.all;

entity decoder__bcd12_a_binario8 is
    port ( enable: IN std_logic;
			  unidad: IN unsigned(3 downto 0);
			  decena: IN unsigned(3 downto 0);
			  centena: IN unsigned(3 downto 0);
			  binario: OUT unsigned(7 downto 0));
			  
end decoder_bcd12_a_binario8;


Architecture solucion of decoder_bcd12_a_binario8 is
   
	  signal var1: unsigned(4 downto 0);
	  
	  signal var2: unsigned(7 downto 0);
	  
	  signal var3: unsigned(3 downto 0);
	  signal var6 unsigned(3 downto 0);

	  
	  signal var4: unsigned(7 downto 0);
	  
	  signal var5: unsigned(7 downto 0);

	  
	  begin 
	  
	  
	  var1= decena*"0010";
	  var2= ('0'&decena(3)&decena(2)&decena(1)&decena(0)&"000")+("000"&var1);
	  
	  var3= centena*"0100";
	  var6= centena*"0010";
	   
	  var4= var2+("0000"&var3);
	  
	  var5= (var6&"0000")+var4;
	  
	  binario= (centena(1)&centena(0)&"000000")+var5;
	  
	  
end solucion;