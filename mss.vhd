LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

entity mss is
    port ( resetn, clk, start,curso_id,estudiante_id,senal_tecla,enter,dato_valido,comp_n_cursos,
			  comp_n_estudiante: IN std_logic;
			  
			 --en_sonido: OUT std_logic;
			 led_curso,led_estudiante,ld_reg_decena,en_reg,ld_reg_unidad,en_unir_numero,
			 ld_cnt_curso,en_cnt_curso,reset_cnt_curso,en_display,
			 ld_cnt_estudiante,en_cnt_estudiante,reset_cnt_estudiante, en_asistencia, e_ram, modo_display: out std_logic;
			 estado: out std_logic_vector ( 4 downto 0);
			 reset_reg: out std_logic);
end mss;



Architecture solucion of mss is
   
	Type estad is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18,s19,s20,s21,s22,s23,s24,s25,s2_1);
	signal y:estad ;
	--signal estado: std_logic_vector ( 3 downto 0)
	
	begin 
	process (resetn, clk, dato_valido)
	    begin
		 
		 if resetn='0' then y<=s0;
		 elsif clk'event and clk='1' then 
		 
		    case y is
			    
				 when s0 => if start='1' then y<=s1;end if;
				 when s1 => if start='0' then y<=s2;end if;
				 when s2 => if curso_id='1' then y<=s2_1; elsif estudiante_id='1' then y<=s15; end if; 
				 when s2_1 => if curso_id='0' then y<=s3;end if;
				 
			    when s3 => if senal_tecla='1' then y<=s4; elsif curso_id='1' then y<=s9 ;end if;
				 when s4 => if senal_tecla='0' then y<=s5; end if;
				 when s5 => if senal_tecla='1' then y<=s6; end if;
				 when s6 => if senal_tecla='0' then y<=s7; end if;
				 when s7 =>  y<=s8; 
				 when s8 => if enter='1' then y<=s2; end if;
				 
				 
				 when s9 =>  y<=s10;
				 when s10 => if curso_id='0' then y<= s11; end if; 
				 when s11 => if curso_id='1' then y<= s12;elsif enter='1' then y<=s14;elsif comp_n_cursos='1' then y<=s13;else y<=s11; end if;
				 when s12 =>  y<=s10;
				 when s13 =>  y<=s9;
				 when s14 =>  y<=s2;
				 when s15 => if estudiante_id='0' then y<= s16; end if;
				 when s16 => if senal_tecla='1' then y<=s17; elsif estudiante_id='1' then y<=s22 ;end if; 
				 when s17 => if senal_tecla='0' then y<=s18; end if;
				 when s18 => if senal_tecla='1' then y<=s19; end if;
				 when s19 => if senal_tecla='0' then y<=s20; end if;
				 when s20 =>  y<=s21; 
				 when s21 => if enter='1' then y<=s2; end if;
				 when s22 => if estudiante_id='0' then y<= s23; end if;
				 when s23 => if dato_valido='1' then y<= s24; end if;
				 when s24 => if estudiante_id='1' then y<= s22;elsif enter='1' then y<= s2;elsif comp_n_estudiante='1' then y<= s25;  end if;
				 when s25 =>  y<=s23;				 
				 				
			end case;
	  end if;
	end process;
	process (y,dato_valido)
	   begin 
		   
			 led_curso<='0';led_estudiante<='0';ld_reg_decena<='0';en_reg<='0';ld_reg_unidad<='0';en_unir_numero<='0';
			 ld_cnt_curso<='0';en_cnt_curso<='0';reset_cnt_curso<='1';en_display<='0';en_cnt_curso<='0';e_ram<='0';
			 ld_cnt_estudiante<='0';en_cnt_estudiante<='0';reset_cnt_estudiante<='1'; en_asistencia<='0'; modo_display<='0';reset_reg<='1';
		
		    				
		case y is
		
			when s0=> estado<="00000"; reset_cnt_curso<='0';reset_cnt_estudiante<='0';
			when s1=> estado<="00001"; 
			when s2=> estado<="00010";reset_reg<='1';
			when s2_1=> estado<="11111";
			
			when s3=> estado<="00011"; if senal_tecla='1' then ld_reg_decena<='1';en_reg<='1'; end if;led_curso<='1';
			when s4=> estado<="00100"; ld_reg_decena<='1';en_reg<='1';led_curso<='1';
			 
			when s5=> estado<="00101"; if senal_tecla='1' then ld_reg_unidad<='1';en_reg<='1'; end if;led_curso<='1';
			when s6=> estado<="00110"; led_curso<='1';--ld_reg_unidad<='1';en_reg<='1';
			when s7=> estado<="00111"; en_unir_numero<='1';led_curso<='1';
			when s8=> estado<="01000"; ld_cnt_curso<='1';en_display<='1';led_curso<='1';
			when s9=> estado<="01001";  en_cnt_curso<='1';led_curso<='1';
			when s10=> estado<="01010"; en_display<='1';
			when s11=> estado<="01011"; en_display<='1';led_curso<='1';
			when s12=> estado<="01100"; en_cnt_curso<='1';led_curso<='1';
			when s13=> estado<="01101"; reset_cnt_curso<='0';led_curso<='1';
			when s14=> estado<="01110"; 
			
			when s15=> estado<="01111"; reset_cnt_estudiante<='0';
			when s16=> estado<="10000"; if senal_tecla='1' then ld_reg_decena<='1';en_reg<='1'; end if;
			
			when s17=> estado<="10001"; led_estudiante<='1';--ld_reg_decena<='1';en_reg<='1'; 
			when s18=> estado<="10010"; if senal_tecla='1' then ld_reg_unidad<='1';en_reg<='1'; end if;led_estudiante<='1';
			when s19=> estado<="10011"; led_estudiante<='1';--ld_reg_unidad<='1';en_reg<='1';
			when s20=> estado<="10100"; en_unir_numero<='1';ld_cnt_estudiante<='1'; led_estudiante<='1';en_display<='1';
			when s21=> estado<="10101"; led_estudiante<='1';en_display<='1';en_asistencia<='1';e_ram<='1';modo_display<='1';
			when s22=> estado<="10110"; 
			
			when s23=> estado<="10111"; led_estudiante<='1';if dato_valido='0' then en_cnt_estudiante<='1'; end if; --en_cnt_estudiante<='1';
			when s24=> estado<="11000"; modo_display<='1';en_display<='1';led_estudiante<='1';if estudiante_id='1' then en_cnt_estudiante<='1';end if;
			when s25=> estado<="11001"; reset_cnt_estudiante<='0';
						
		end case;
	end process;
end solucion;