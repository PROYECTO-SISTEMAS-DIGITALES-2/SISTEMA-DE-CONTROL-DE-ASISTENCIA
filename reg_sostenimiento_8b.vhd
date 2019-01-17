library ieee;
use ieee.std_logic_1164.all;

entity reg_sostenimiento_8b is
    port ( en_reg,reset_reg,clock: IN std_logic;
	        data_in: in std_logic_vector(7 downto 0);ld_reg: IN std_logic;
			  
			  data_out: buffer std_logic_vector(7 downto 0):= "00000000");
end reg_sostenimiento_8b;

architecture solucion of reg_sostenimiento_8b is

    signal var:std_logic_vector(7 downto 0):= "00000000";
	 begin
	 
    process (reset_reg, clock)
	    begin
		 var<=data_out;
		 if reset_reg='0' then data_out<="00000000";
		 elsif clock'event and clock='1' then
		  if ld_reg='1'then
				  case en_reg is
					when '0' => data_out<=var;
					when '1' => data_out<=data_in;																																																							
				end case;
		  end if;
		end if;
		
	end process;
	
end solucion;