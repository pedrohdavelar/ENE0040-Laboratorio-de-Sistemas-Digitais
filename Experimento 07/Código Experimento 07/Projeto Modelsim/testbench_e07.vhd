-- Experimento 07 - TESTBENCH
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 25/01/2025

-- Testbench - Tempo de simulação: ?

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.type_estado.ALL;

ENTITY TESTBENCH_E07_MAQ_REFRI IS
END TESTBENCH_E07_MAQ_REFRI;

ARCHITECTURE ARC_TESTBENCH_E07_MAQ_REFRI OF TESTBENCH_E07_MAQ_REFRI IS
COMPONENT MAQ_MOORE_REFRI IS
    PORT (
          CLK        : IN  STD_LOGIC;
          A          : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
          L, D50, D25: OUT STD_LOGIC;
          CURRENT_STATE: OUT ESTADO
          );
END COMPONENT;

    SIGNAL CLK_TB: STD_LOGIC := '0';
    SIGNAL A_TB: STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL L_TB, D50_TB, D25_TB: STD_LOGIC;
    SIGNAL CURRENT_STATE_TB: ESTADO;	

    BEGIN
        DUT: MAQ_MOORE_REFRI PORT MAP (CLK_TB, A_TB, L_TB, D50_TB, D25_TB,CURRENT_STATE_TB);
        CLK_TB <= NOT CLK_TB AFTER 5 NS;
        PROCESS
        BEGIN
        REPORT "INICIANDO TESTE..." SEVERITY NOTE;
-- CENARIO 1: INIT -> VLR_25 -> DEVOLVE_25 -> INIT
--A:               01        11            XX 
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 2: INIT -> VLR_25 -> VLR_50 -> DEVOLVE_50 -> INIT
--A:               01        01        11            XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 3: INIT -> VLR_50 -> DEVOLVE_50 -> INIT  
--A:               10        11            XX
        A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 3: INIT -> VLR_25 -> VLR_50 -> VLR_75 -> DEVOLVE_75 -> INIT
--A:               01        01        01        11            XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS; 
-- CENARIO 4: INIT -> VLR_25 -> VLR_75 -> DEVOLVE_75 -> INIT
--A:               01        10        11            XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 5: INIT -> VLR_50 -> VLR_75 -> DEVOLVE_75 -> INIT  
--A:               10        01        11            XX
        A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "11"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 6: INIT -> VLR_25 -> VLR_50 -> VLR_75 -> VLR_100 -> INIT
--A:               01        01        01        01         XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 7: INIT -> VLR_25 -> VLR_50 -> VLR_100 -> INIT
--A:               01        01        10        XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 8: INIT -> VLR_25 -> VLR_75 -> VLR_100 -> INIT  
--A:               01        10        01        XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 9: INIT -> VLR_50 -> VLR_100 -> INIT
--A:               10        10        XX
        A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 10: INIT -> VLR_25 -> VLR_50 -> VLR_75 -> VLR_125 -> INIT
--A:               01        01        01        10        XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 11: INIT -> VLR_25 -> VLR_75 -> VLR_125 -> INIT
--A:                01        10        10         XX
        A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 12: INIT -> VLR_50 -> VLR_75 -> VLR_125 -> INIT
--A:                10        01        10         XX
        A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "10"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS;
-- CENARIO 13: INIT -> INIT -> VLR_25 -> VLR_25 -> VLR_50 -> VLR_50 -> VLR_75 -> VLR_75 -> VLR_100 -> INIT
--	            00      01        00        01        00        01        00        01         00
        A_TB <= "00"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; 
        A_TB <= "00"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS; A_TB <= "01"; WAIT FOR 10 NS; A_TB <= "00"; WAIT FOR 10 NS; 
 
        REPORT "TESTE FINALIZADO!" SEVERITY NOTE;
        WAIT;
        END PROCESS;
END ARC_TESTBENCH_E07_MAQ_REFRI;





