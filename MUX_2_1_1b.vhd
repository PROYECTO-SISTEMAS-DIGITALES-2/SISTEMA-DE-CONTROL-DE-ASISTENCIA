library ieee;
use ieee.std_logic_1164.all;

entity MUX_2_1_1b is
    port ( select0: IN std_logic;
			  IN_0,IN_1: IN std_logic;
			  
			  salida_mux: OUT std_logic);
end MUX_2_1_1b;

Architecture solucion of MUX_2_1_1b is
   signal aaa:std_logic;
   begin 

	 aaa<=select0;
	 PROCESS(aaa)
	 begin
	 
	 case (aaa) is 
			 
			 when '0' => salida_mux<=IN_0;
			 when '1' => salida_mux<=IN_1;
	END CASE;
	
	end process;
	
end solucion;
