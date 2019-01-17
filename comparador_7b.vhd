library ieee;
use ieee.std_logic_1164.all;

entity comparador_7b is
    port ( A,B: in std_logic_vector(6 downto 0);
			  
			  A_IGUAL_B,A_MAYOR_B,A_MENOR_B: OUT std_logiC);
end comparador_7b;

architecture solucion of comparador_7b is
  begin
    A_IGUAL_B<='1' when A=B ELSE '0';
	 A_MAYOR_B<='1' WHEN A>B ELSE '0';
	 A_MENOR_B<='1' WHEN A<B ELSE '0';
	 
END solucion;
