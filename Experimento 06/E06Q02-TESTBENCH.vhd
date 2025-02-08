-- Experimento 06 - Questão 01 - TESTBENCH
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 12/01/2025

-- Testbench - tempo de simulação: 1080ns

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TESTBENCH_Q02 IS 
END TESTBENCH_Q02;

ARCHITECTURE ARC_TESTBENCH_Q02 OF TESTBENCH_Q02 IS

    COMPONENT REGISTRADOR_DESLOCAMENTO_BIDIRECIONAL IS
    PORT (CLK, RST, LOAD, DIR, L, R: IN STD_LOGIC;
          D: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
          Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    SIGNAL D_TB: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Q_TB: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL CLOCK_TB : STD_LOGIC  := '0';
    SIGNAL RLD_TB: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL LR_TB: STD_LOGIC_VECTOR(1 DOWNTO 0);
  
	BEGIN
        DUT: REGISTRADOR_DESLOCAMENTO_BIDIRECIONAL 
        PORT MAP (CLOCK_TB, RLD_TB(2), RLD_TB(1), RLD_TB(0), LR_TB(1), LR_TB(0), D_TB, Q_TB);
        CLOCK_TB <= NOT(CLOCK_TB) AFTER 5 NS;
        PROCESS
        BEGIN
            REPORT "INICIANDO TESTE..."SEVERITY NOTE;
            
            -- Teste 1: LOAD
            D_TB <= "0101"; RLD_TB <= "010"; LR_TB <= "00";
            WAIT FOR 20 NS;
            FOR I IN STD_LOGIC RANGE '0' TO '1' LOOP
                RLD_TB(0) <= I;
                FOR K IN STD_LOGIC RANGE '0' TO '1' LOOP
                    LR_TB(1) <= K;
                    FOR L IN STD_LOGIC RANGE '0' TO '1' LOOP
                        LR_TB(0) <= L;
                        WAIT FOR 20 NS;
                    END LOOP;
                END LOOP;
            END LOOP;
            
            -- Teste 2: RESET
            RLD_TB <= "100"; LR_TB <= "00";
            WAIT FOR 20 NS;
            FOR I IN STD_LOGIC RANGE '0' TO '1' LOOP
                RLD_TB(1) <= I;
                FOR J IN STD_LOGIC RANGE '0' TO '1' LOOP
                    RLD_TB(0) <= J;
                    FOR K IN STD_LOGIC RANGE '0' TO '1' LOOP
                        LR_TB(1) <= K;
                        FOR L IN STD_LOGIC RANGE '0' TO '1' LOOP
                            LR_TB(0) <= L;
                            WAIT FOR 20 NS;
                        END LOOP;
                    END LOOP;
                END LOOP;
            END LOOP;

            -- Teste 3a: Deslocamento para a esquerda
            RLD_TB <= "000"; 
            LR_TB <= "10";      -- Deslocamento com uns
            WAIT FOR 80 NS;
            LR_TB <= "00";      -- Deslocamento com zeros
            WAIT FOR 80 NS;
            LR_TB <= "11";      -- Deslocamento com uns
            WAIT FOR 80 NS;
            LR_TB <= "01";      -- Deslocamento com zeros
            WAIT FOR 80 NS; 

            -- Teste 3b: Deslocamento para a direita
            RLD_TB <= "001"; 
            LR_TB <= "01";      -- Deslocamento com uns
            WAIT FOR 80 NS;
            LR_TB <= "00";      -- Deslocamento com zeros
            WAIT FOR 80 NS;
            LR_TB <= "11";      -- Deslocamento com uns
            WAIT FOR 80 NS;
            LR_TB <= "10";      -- Deslocamento com zeros
            WAIT FOR 80 NS;


            REPORT "TESTE FINALIZADO!" SEVERITY NOTE;
            WAIT;
        END PROCESS;
END ARC_TESTBENCH_Q02;