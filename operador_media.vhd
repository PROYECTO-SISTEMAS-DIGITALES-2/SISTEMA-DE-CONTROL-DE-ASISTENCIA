library ieee;
use ieee.std_logic_1164.all;

entity operador_media is
    port ( en_media,ing_data,fin_data,clock: IN std_logic;
	        data_in: in std_logic_vector(7 downto 0);
			  
			  data_out: buffer std_logic_vector(7 downto 0):= "00000000");
end operador_media;

architecture solucion of operador_media is

    signal var:std_logic_vector(7 downto 0):= "00000000";
	 begin
	 
   
	
end solucion;