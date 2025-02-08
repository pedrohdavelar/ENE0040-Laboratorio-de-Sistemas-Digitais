-- Experimento 02 - Questão 01
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 02/11/2024

-- Funções lógicas do somador completo:
-- S = A xor B xor Cin
-- Cout = AB or ACin or BCin

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SOMADOR_COMPLETO IS
	PORT (A,B,CIN: IN STD_LOGIC;                       --ENTRADAS
      	      S,COUT: OUT STD_LOGIC);                  --SAÍDAS
END SOMADOR_COMPLETO;

ARCHITECTURE ARC_SOMADOR_COMPLETO OF SOMADOR_COMPLETO IS
BEGIN
	S <= A XOR B XOR CIN;                              --S = A xor B xor Cin
	COUT <= (A AND B) OR (A AND CIN) OR (B AND CIN);   --Cout = AB or ACin or BCin
END ARC_SOMADOR_COMPLETO;