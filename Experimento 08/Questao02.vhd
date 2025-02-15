-- Experimento 08 Atividade 1
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 05/02/2025

-- Contador BCD Modulo 100

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.TYPE_ESTADO_BCD.ALL;

ENTITY CONTADOR_BCD_MOD100 IS
    PORT (
        CLOCK: IN STD_LOGIC;
        RESET: IN STD_LOGIC;
        ENABLE: IN STD_LOGIC;
        D_UNIDADE: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        D_DEZENA: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        LOAD: IN STD_LOGIC;
        Q_UNIDADE: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Q_DEZENA: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        CURRENT_STATE_UNIDADE: OUT ESTADO_BCD;
        CURRENT_STATE_DEZENA: OUT ESTADO_BCD
        );
END CONTADOR_BCD_MOD100;

ARCHITECTURE ARC_CONTADOR_BCD_MOD100 OF CONTADOR_BCD_MOD100 IS
--CONTADOR BCD10 DA QUESTAO 1
COMPONENT CONTADOR_BCD_MOD10 IS
    PORT (
        CLOCK   : IN STD_LOGIC;
        RESET   : IN STD_LOGIC;
        ENABLE  : IN STD_LOGIC;
        RCI     : IN STD_LOGIC;
        D       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        LOAD    : IN STD_LOGIC;
        Q       : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        RCO     : OUT STD_LOGIC;
        CURRENT_STATE: OUT ESTADO_BCD
        );
END COMPONENT;
SIGNAL RCO_UNIDADE: STD_LOGIC;
SIGNAL RCI_DEZENA: STD_LOGIC;
SIGNAL RCO_DEZENA: STD_LOGIC;
BEGIN
BCD_UNIDADE: CONTADOR_BCD_MOD10 PORT MAP (CLOCK, RESET,ENABLE, '0', D_UNIDADE, LOAD, Q_UNIDADE,RCO_UNIDADE, CURRENT_STATE_UNIDADE);
BCD_DEZENA: CONTADOR_BCD_MOD10 PORT MAP (CLOCK, RESET,ENABLE, RCI_DEZENA, D_DEZENA, LOAD, Q_DEZENA, RCO_DEZENA, CURRENT_STATE_DEZENA);
RCI_DEZENA <= RCO_UNIDADE;
END ARC_CONTADOR_BCD_MOD100;