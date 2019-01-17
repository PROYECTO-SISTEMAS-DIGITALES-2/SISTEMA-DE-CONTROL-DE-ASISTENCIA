library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX_8_1_8b is
    port ( en_mux,s2,s1,s0: IN std_logic;
			  IN_0,IN_1,IN_2,IN_3,IN_4,IN_5,IN_6,IN_7: IN std_logic_vector(7 downto 0);
			  
			  salida_mux: OUT std_logic_vector(7 downto 0));
			  
end MUX_8_1_8b;

Architecture solucion of MUX_8_1_8b is
   signal aaa:std_logic_vector(2 downto 0);
   begin 
	
	 aaa<=(s2&s1&s0);
	 PROCESS(aaa,en_mux)
	 begin
	 if en_mux='0' then salida_mux<="00000000";
	 else  
	  case (aaa) is 	 
			 when "000" => salida_mux<=IN_0;
			 when "001" => salida_mux<=IN_1;
			 when "010" => salida_mux<=IN_2;
			 when "011" => salida_mux<=IN_3;
			 when "100" => salida_mux<=IN_4;
			 when "101" => salida_mux<=IN_5;
			 when "110" => salida_mux<=IN_6;
			 when "111" => salida_mux<=IN_7;
			 
	   END CASE;
	  end if;
	end process;
end solucion;