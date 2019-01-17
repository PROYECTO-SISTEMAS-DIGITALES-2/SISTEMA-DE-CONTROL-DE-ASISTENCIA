Library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity codificador_decimal_binario_3b is
    port ( IN_0,IN_1,IN_2,IN_3,IN_4,IN_5,IN_6,IN_7: IN std_logic;
			  salida_mux: OUT std_logic_vector(2 downto 0));
end codificador_decimal_binario_3b;

Architecture solucion of codificador_decimal_binario_3b is
   signal aaa:std_logic_vector(2 downto 0);
   begin 
	 PROCESS(IN_0,IN_1,IN_2,IN_3,IN_4,IN_5,IN_6,IN_7)
	 begin
	 
	  if In_7='1' then salida_mux<= "111";
	  elsif In_6='1' then salida_mux<= "110";
	  elsif In_5='1' then salida_mux<= "101";
	  elsif In_4='1' then salida_mux<= "100";
	  elsif In_3='1' then salida_mux<= "011";
	  elsif In_2='1' then salida_mux<= "010";
	  elsif In_1='1' then salida_mux<= "001";
	  else salida_mux<= "000";
	  
	  end if; 
	 
	end process;
end solucion;