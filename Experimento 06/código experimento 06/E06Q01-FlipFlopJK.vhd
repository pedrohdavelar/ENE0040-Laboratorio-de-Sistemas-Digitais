-- Experimento 06 - Quest�o 01
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 08/01/2025

-- Flip-Flop JK

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FLIP_FLOP_JK IS
	PORT (PRESET, CLR, CLK, J, K:  IN STD_LOGIC;
	                           Q: OUT STD_LOGIC);
END FLIP_FLOP_JK;

ARCHITECTURE ARC_FLIP_FLOP_JK OF FLIP_FLOP_JK IS
SIGNAL GDA_Q : STD_LOGIC := '0';
SIGNAL JK    : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN
	JK <= J & K;
	PROCESS(PRESET,CLR,CLK)
	BEGIN
		IF PRESET = '1' THEN GDA_Q <= '1';
		ELSIF CLR = '1' THEN GDA_Q <= '0';
		ELSIF RISING_EDGE(CLK) THEN
			CASE JK IS
				WHEN "00" => NULL;
			    WHEN "01" => GDA_Q <= '0';
				WHEN "10" => GDA_Q <= '1';
				WHEN "11" => GDA_Q <= NOT(GDA_Q);
				WHEN OTHERS => NULL;
			END CASE;
		END IF;
	END PROCESS;
	Q <= GDA_Q;	
END ARC_FLIP_FLOP_JK;
