-- Experimento 05 - Questão 03
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 16/12/2024

--Testbench

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TESTBENCH IS 
	PORT (S_DUT, S_GM: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	      AT, BT:       OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END TESTBENCH;

ARCHITECTURE TESTBENCH_ARC OF TESTBENCH IS
BEGIN
		PROCESS
			VARIABLE CONT_A: UNSIGNED (3 DOWNTO 0);
			VARIABLE CONT_B: UNSIGNED (3 DOWNTO 0);
		BEGIN
			
			REPORT "INICIANDO TESTE..."SEVERITY NOTE;
			
			CONT_A  := "0000";
			CONT_B  := "0000";
			
			FOR I IN 0 TO 15 LOOP
				AT <= STD_LOGIC_VECTOR(CONT_A);
				FOR J IN 0 TO 15 LOOP
					BT <= STD_LOGIC_VECTOR(CONT_B);
					WAIT FOR 500 ns;
					ASSERT (S_DUT = S_GM) REPORT "FALHOU: I = " & INTEGER'IMAGE(I) & " J = " & INTEGER'IMAGE(J) SEVERITY ERROR;
					CONT_B := CONT_B + "1";
				END LOOP;
				CONT_A := CONT_A + "1";
			END LOOP;
			
			REPORT "TESTE FINALIZADO!" SEVERITY NOTE;
			
			WAIT;
		END PROCESS;
END TESTBENCH_ARC;
				