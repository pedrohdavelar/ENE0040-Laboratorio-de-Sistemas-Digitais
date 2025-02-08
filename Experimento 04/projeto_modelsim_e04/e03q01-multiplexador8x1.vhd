-- Experimento 03 - Questão 01
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 13/11/2024

-- Multiplexador 8x1
-- Entrada: Vetor S (3 bits) e Vetor D (8 bits)
-- Saída: Y (1 bit)

--Tabela Verdade:
--  S   |   Y
-- 000      D0
-- 001      D1
-- 010      D2
-- 011      D3
-- 100      D4
-- 101      D5
-- 110      D6
-- 111      D7

-- D7: 10000000
-- D6: 01000000
-- D5: 00100000
-- D4: 00010000
-- D3: 00001000
-- D2: 00000100
-- D1: 00000010
-- D0: 00000001  

-- Usar atribuições condicionais WHEN-ELSE

-- Alterado o nome da entity e da saida Y

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX8X1 IS
	PORT (S: IN STD_LOGIC_VECTOR (2 DOWNTO 0);       -- SELETOR 3 BITS
	      D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);       -- ENTRADA 8 BITS
      	  Y_MUX: OUT STD_LOGIC);                         -- SAÍDA
END MUX8X1;

ARCHITECTURE ARC_MUX8X1 OF MUX8X1 IS
BEGIN
        Y_MUX <= D(0) WHEN (S = "000") ELSE    -- S=000 -> Y=D0
                 D(1) WHEN (S = "001") ELSE    -- S=001 -> Y=D1
                 D(2) WHEN (S = "010") ELSE    -- S=010 -> Y=D2
                 D(3) WHEN (S = "011") ELSE    -- S=011 -> Y=D3
                 D(4) WHEN (S = "100") ELSE    -- S=100 -> Y=D4
                 D(5) WHEN (S = "101") ELSE    -- S=101 -> Y=D5
                 D(6) WHEN (S = "110") ELSE    -- S=110 -> Y=D6
                 D(7) WHEN (S = "111") ELSE    -- S=111 -> Y=D7
                 '0';                          -- Demais casos - Y=0

	
END ARC_MUX8X1;



