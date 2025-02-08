-- Experimento 08 Atividade 1
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 05/02/2025

-- Contador BCD Modulo 10

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.TYPE_ESTADO_BCD.ALL;

ENTITY CONTADOR_BCD_MOD10 IS
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
END CONTADOR_BCD_MOD10;

ARCHITECTURE ARC_CONTADOR_BCD_MOD10 OF CONTADOR_BCD_MOD10 IS

    SIGNAL ESTADO_ATUAL, PROXIMO_ESTADO: ESTADO_BCD;

    BEGIN
        CURRENT_STATE <= ESTADO_ATUAL; -- para poder observar o estado no testbench

        PROCESSO_SINCRONO: PROCESS (CLOCK)
        BEGIN
            IF RISING_EDGE(CLOCK) THEN
                ESTADO_ATUAL <= PROXIMO_ESTADO;
            END IF;
        END PROCESS PROCESSO_SINCRONO;

        PROCESSO_COMBINACIONAL: PROCESS (ESTADO_ATUAL, RESET, ENABLE, RCI, D, LOAD)
        BEGIN
            Q <= "0000";
            RCO <= '1';
            IF RESET = '1' THEN
                PROXIMO_ESTADO <= BCD_0;
            ELSIF LOAD = '1' THEN
                CASE D IS 
                    WHEN "0000" => PROXIMO_ESTADO <= BCD_0;
                    WHEN "0001" => PROXIMO_ESTADO <= BCD_1;
                    WHEN "0010" => PROXIMO_ESTADO <= BCD_2;
                    WHEN "0011" => PROXIMO_ESTADO <= BCD_3;
                    WHEN "0100" => PROXIMO_ESTADO <= BCD_4;
                    WHEN "0101" => PROXIMO_ESTADO <= BCD_5;
                    WHEN "0110" => PROXIMO_ESTADO <= BCD_6;
                    WHEN "0111" => PROXIMO_ESTADO <= BCD_7;
                    WHEN "1000" => PROXIMO_ESTADO <= BCD_8;
                    WHEN "1001" => PROXIMO_ESTADO <= BCD_9;
                    WHEN OTHERS => PROXIMO_ESTADO <= BCD_0;
                END CASE;
            ELSIF ENABLE = '0' AND RCI = '0' THEN
                CASE ESTADO_ATUAL IS
                    WHEN BCD_0 => PROXIMO_ESTADO <= BCD_1;
                    WHEN BCD_1 => PROXIMO_ESTADO <= BCD_2;
                    WHEN BCD_2 => PROXIMO_ESTADO <= BCD_3;
                    WHEN BCD_3 => PROXIMO_ESTADO <= BCD_4;
                    WHEN BCD_4 => PROXIMO_ESTADO <= BCD_5;
                    WHEN BCD_5 => PROXIMO_ESTADO <= BCD_6;
                    WHEN BCD_6 => PROXIMO_ESTADO <= BCD_7;
                    WHEN BCD_7 => PROXIMO_ESTADO <= BCD_8;
                    WHEN BCD_8 => PROXIMO_ESTADO <= BCD_9;
                    WHEN BCD_9 => PROXIMO_ESTADO <= BCD_0;
                    WHEN OTHERS => PROXIMO_ESTADO <= BCD_0;
                END CASE;
            ELSE
                PROXIMO_ESTADO <= ESTADO_ATUAL;
            END IF;
            CASE PROXIMO_ESTADO is
                WHEN BCD_0 => Q <= "0000";
                WHEN BCD_1 => Q <= "0001";
                WHEN BCD_2 => Q <= "0010";
                WHEN BCD_3 => Q <= "0011";
                WHEN BCD_4 => Q <= "0100";
                WHEN BCD_5 => Q <= "0101";
                WHEN BCD_6 => Q <= "0110";
                WHEN BCD_7 => Q <= "0111";
                WHEN BCD_8 => Q <= "1000";
                WHEN BCD_9 => Q <= "1001"; RCO <= '0';
                WHEN OTHERS => Q <= "0000";
            END CASE;
        END PROCESS PROCESSO_COMBINACIONAL;
    END ARC_CONTADOR_BCD_MOD10;

