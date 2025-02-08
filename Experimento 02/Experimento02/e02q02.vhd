-- Experimento 02 - Questão 02
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 02/11/2024

-- Função lógica do multiplexador 4 para 1:
-- Y = D0!S1!S0 + D1!S1S0 + D2S1!S0 + D3S1S0 

-- ALTERADO O NOME DA ENTITY E DA SAIDA Y

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX4X1 IS
	PORT (D: IN STD_LOGIC_VECTOR (3 DOWNTO 0);               --ENTRADA
	      S: IN STD_LOGIC_VECTOR (1 DOWNTO 0);               --SELEÇÃO
      	  Y_MUX: OUT STD_LOGIC);                             --SAÍDA
END MUX4X1;

ARCHITECTURE ARC_MUX4X1 OF MUX4X1 IS
BEGIN
	Y_MUX <= (D(0) AND NOT(S(1)) AND NOT(S(0))) OR           --D0!S1!S0
             (D(1) AND NOT(S(1)) AND     S(0))  OR           --D1!S1S0
	     (D(2) AND     S(1)  AND NOT(S(0))) OR               --D2S1!S0
	     (D(3) AND     S(1)  AND     S(0));                  --D3S1S0
END ARC_MUX4X1;