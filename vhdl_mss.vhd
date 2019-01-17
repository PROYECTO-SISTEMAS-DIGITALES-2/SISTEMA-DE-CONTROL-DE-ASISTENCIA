LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity vhdl_mss is
    port ( resetn, clk, start, modo_practica,modo_melodia,modo_reproducir,
	        regresar,s_teclas_activadas,s_datos_validos,comp_6_ram,
			  comp_36_address,comp_7_read,ok_delay_1s: IN std_logic;
			  
			 --en_sonido: OUT std_logic;
			 reset_cnt_ram, reset_delay_1s, reset_cnt_address,
			 reset_cnt_read, en_sonido, en_cnt_ram, en_cnt_address,en_cnt_read, 
			 en_mux_read, en_delay_1s, en_display_notas, en_display_melodia,modo_bocina: out std_logic;
			 estado: out std_logic_vector ( 4 downto 0));
end vhdl_mss;



Architecture solucion of vhdl_mss is
   
	Type estad is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s21);
	signal y:estad ;
	--signal estado: std_logic_vector ( 3 downto 0)
	
	begin 
	process (resetn, clk)
	    begin
		 
		 if resetn='0' then y<=s0;
		 elsif clk'event and clk='1' then 
		 
		    case y is
			    
				 when s0 => if start='1' then y<=s1;end if;
				 when s1 => if start='0' then y<=s2;end if;
				 when s2 => if curso_id='1' then y<=s21; elsif estudiante_id='1' then y<=s11; end if; 
				 when s21 => if curso_id='0' then y<=s3;end if;
			    when s3 => if s_teclas_activadas='1' then y<=s4; elsif curso_id='1' then y<=s8 ;end if;
				 when s4 => if s_teclas_activadas='0' then y<=s5; end if;
				 when s5 => if s_teclas_activadas='1' then y<=s6; end if;
				 when s6 => if s_teclas_activadas='0' then y<=s7; end if;
				 when s7 => if enter='1' then y<=s3; end if;
				  
				 when s8 => if curso_id='0' then y<= s9; end if; 
				 when s9 => if curso_id='0' then y<= s9;elsif enter='1' then y<=s10;elsif comp_n_cursos='1' then y<=s10;else y<=s8; end if; 
				 when s10=> if ok_delay_1s='1' then y<=s11 ; end if;
				 when s11=> if regresar='1' then y<=s2 ; elsif s_datos_validos='1' then y<=s10; elsif comp_7_read='1' then y<=s2 ; else y<=s9; end if;
				 when s12=> y<= s2;
				 				
			end case;
	  end if;
	end process;
	process (y)
	   begin 
		    				
		case y is
		
			when s0=> estado<="00000"; 
			when s1=> estado<="00001";
			when s2=> estado<="00010"; 
			
			when s3=> estado<="00011"; 
			when s4=> estado<="00100"; 
			when s5=> estado<="00101";
			when s6=> estado<="00110"; 
			when s7=> estado<="00111"; 
			when s8=> estado<="01000"; 
			when s9=> estado<="01001";  
			when s10=> estado<="01010"; 
			when s11=> estado<="01011"; 
			when s12=> estado<="01100"; 
			
						
		end case;
	end process;
end solucion;