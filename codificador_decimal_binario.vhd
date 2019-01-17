library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity codificador_decimal_binario is
    port ( IN_0,IN_1,IN_2,IN_3,IN_4,IN_5,IN_6,IN_7,In_8,In_9,In_10: IN std_logic;
			  salida_mux: OUT std_logic_vector(3 downto 0));
end codificador_decimal_binario;

Architecture solucion of codificador_decimal_binario is
   signal aaa:std_logic_vector(3 downto 0);
   begin 
	 PROCESS(IN_0,IN_1,IN_2,IN_3,IN_4,IN_5,IN_6,IN_7,In_8,In_9,In_10)
	 begin
	 
	  if In_10='1' then salida_mux<= "1010" ;
	  elsif In_9='1' then salida_mux<= "1001";
	  elsif In_8='1' then salida_mux<= "1000";
	  elsif In_7='1' then salida_mux<= "0111";
	  elsif In_6='1' then salida_mux<= "0110";
	  elsif In_5='1' then salida_mux<= "0101";
	  elsif In_4='1' then salida_mux<= "0100";
	  elsif In_3='1' then salida_mux<= "0011";
	  elsif In_2='1' then salida_mux<= "0010";
	  elsif In_1='1' then salida_mux<= "0001";
	  elsif In_0='1' then salida_mux<= "0000";
	  else salida_mux<= "0000";
	  
	  end if; 
	 
	end process;
end solucion;