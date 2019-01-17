library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contador_7b is
    port ( en_cnt,reset_cnt,clock,ld_cnt: IN std_logic;data_in: IN std_logic_vector (6 downto 0);
			  
			  data_out: buffer std_logic_vector(6 downto 0):="0000000");
end contador_7b;

architecture solucion of contador_7b is

    signal var:std_logic_vector(6 downto 0):= "0000000";
	 begin
    process (reset_cnt, clock)
	    begin
		 
		 var<=data_out;
		 
		 if reset_cnt='0' then data_out<="0000000";
		 elsif clock'event and clock='1' then
		  if (en_cnt='1')then
		   data_out<=var+"0000001";
			
		  elsif (ld_cnt='1') then
				 data_out<=data_in;
			  
			  
			end if;
			
		end if;
		
	end process;

	

end solucion;