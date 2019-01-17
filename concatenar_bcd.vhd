library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;


entity concatenar_bcd is

    port ( --enable: IN std_logic;
	        
			  unidad: IN unsigned(3 downto 0);
			  decena: IN unsigned(3 downto 0);
			  centena: IN unsigned(3 downto 0);
			  bcd_12: OUT unsigned(11 downto 0));
			  
end concatenar_bcd;


Architecture solucion of concatenar_bcd is
   
	  begin
	  
	  bcd_12<= (centena&decena&unidad);
	  
end solucion;

