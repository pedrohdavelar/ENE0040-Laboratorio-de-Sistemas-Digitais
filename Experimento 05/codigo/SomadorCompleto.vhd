-- Experimento 02 - Quest�o 01
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 02/11/2024

-- Fun��es l�gicas do somador completo:
-- S = A xor B xor Cin
-- Cout = AB or ACin or BCin

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SOMADOR_COMPLETO IS
	PORT (A,B,CIN: IN STD_LOGIC;                       --ENTRADAS
      	      S,COUT: OUT STD_LOGIC);                  --SA�DAS
END SOMADOR_COMPLETO;

ARCHITECTURE ARC_SOMADOR_COMPLETO OF SOMADOR_COMPLETO IS
BEGIN
	S <= A XOR B XOR CIN;                              --S = A xor B xor Cin
	COUT <= (A AND B) OR (A AND CIN) OR (B AND CIN);   --Cout = AB or ACin or BCin
END ARC_SOMADOR_COMPLETO;
