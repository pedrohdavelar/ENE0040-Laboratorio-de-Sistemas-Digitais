-- Experimento 06 - Questão 01 - TESTBENCH
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 08/01/2025

-- Testbench - Tempo de simulação: 400ns

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY TESTBENCH_Q01 IS 
END TESTBENCH_Q01;

ARCHITECTURE ARC_TESTBENCH_Q01 OF TESTBENCH_Q01 IS

    COMPONENT FLIP_FLOP_JK IS
	PORT (PRESET, CLR, CLK, J, K:  IN STD_LOGIC;
	                           Q: OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL JK_TB: STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL Q_TB: STD_LOGIC;
    SIGNAL PRESET_TB: STD_LOGIC;
    SIGNAL CLEAR_TB : STD_LOGIC;
    SIGNAL CLOCK_TB : STD_LOGIC  := '0';
 
	BEGIN
        DUT: FLIP_FLOP_JK PORT MAP (PRESET_TB, CLEAR_TB, CLOCK_TB, JK_TB(1), JK_TB(0), Q_TB);
        CLOCK_TB <= NOT(CLOCK_TB) AFTER 5 NS;
        PROCESS
        BEGIN
        REPORT "INICIANDO TESTE..."SEVERITY NOTE;
                FOR I IN STD_LOGIC RANGE '0' TO '1' LOOP
                    PRESET_TB <= I;
                    FOR J IN STD_LOGIC RANGE '0' TO '1' LOOP
                        CLEAR_TB <= J;
                        JK_TB <= "00";
                        WAIT FOR 20 NS;
                        JK_TB <= "01";
                        WAIT FOR 20 NS;
                        JK_TB <= "10";
                        WAIT FOR 20 NS;
                        JK_TB <= "11";
                        WAIT FOR 20 NS;
                    END LOOP;
                END LOOP;
                PRESET_TB <= '0';
                CLEAR_TB <= '0';
                JK_TB <= "00";
                WAIT FOR 20 NS;
                JK_TB <= "01";
                WAIT FOR 20 NS;
                JK_TB <= "10";
                WAIT FOR 20 NS;
                JK_TB <= "11";
                WAIT FOR 20 NS;

                REPORT "TESTE FINALIZADO!" SEVERITY NOTE;
                WAIT;
        END PROCESS;
END ARC_TESTBENCH_Q01;