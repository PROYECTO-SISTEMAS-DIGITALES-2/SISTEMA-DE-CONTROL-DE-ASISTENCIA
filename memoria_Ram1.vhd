library IEEE; 
use IEEE.STD_LOGIC_1164.ALL;
 use IEEE.STD_LOGIC_UNSIGNED.ALL;
 entity memoria_Ram1 is  port( clk, we, en: in STD_LOGIC;
	 addr: in STD_LOGIC_VECTOR(6 downto 0);
	 di: in STD_LOGIC_VECTOR(7 downto 0);
	 do: out STD_LOGIC_VECTOR(7 downto 0):="00000000");
 end memoria_Ram1;

 architecture Behavioral of memoria_Ram1 is 
	 type ram_type is array(127 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
	 signal RAM: ram_type;
	 begin  
	 
	 process(clk)  
	 begin 
		 if clk'event and clk = '1' then 
			if en = '1' then 
				if we = '1' then 
					RAM(conv_integer(addr)) <= di; 
				
				end if; 
				
				
			end if; 
			
			 --do <= RAM(conv_integer(addr));

		end if;
		
	end process;
			 do <= RAM(conv_integer(addr));

end Behavioral;
