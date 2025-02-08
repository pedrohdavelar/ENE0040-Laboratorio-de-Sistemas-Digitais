-- Experimento 02 - Questão 01
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 02/11/2024

-- Funções lógicas do somador completo:
-- S = A xor B xor Cin
-- Cout = AB or ACin or BCin

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CIRCUITO_E02Q01 IS
	PORT (A,B,CIN: IN STD_LOGIC;                       --ENTRADAS
      	      S,COUT: OUT STD_LOGIC);                      --SAÍDAS
END CIRCUITO_E02Q01;

ARCHITECTURE ARC_CIRCUITO_E02Q01 OF CIRCUITO_E02Q01 IS
BEGIN
	S <= A XOR B XOR CIN;                              --S = A xor B xor Cin
	COUT <= (A AND B) OR (A AND CIN) OR (B AND CIN);   --Cout = AB or ACin or BCin
END ARC_CIRCUITO_E02Q01;