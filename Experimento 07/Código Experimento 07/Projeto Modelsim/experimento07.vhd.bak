-- Experimento 07
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 25/01/2025

-- Maquina de Estado Síncrona de Moore - Máquina de Refrigerante

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.type_estado.ALL;


ENTITY MAQ_MOORE_REFRI is
    PORT (
          CLK        : IN  STD_LOGIC;
          A          : IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
          L, D50, D25: OUT STD_LOGIC;
          CURRENT_STATE: OUT ESTADO
          );
END MAQ_MOORE_REFRI;

ARCHITECTURE ARC_MAQ_MOORE_REFRI OF MAQ_MOORE_REFRI IS
    
    SIGNAL ESTADO_ATUAL, PROXIMO_ESTADO: ESTADO;
      
    BEGIN
        CURRENT_STATE <= ESTADO_ATUAL;  
        PROCESSO_SINCRONO: PROCESS (CLK)
        BEGIN
            IF RISING_EDGE(CLK) THEN
                ESTADO_ATUAL <= PROXIMO_ESTADO;
            END IF;
        END PROCESS PROCESSO_SINCRONO;

        PROCESSO_COMBINACIONAL: PROCESS (ESTADO_ATUAL, A)
        BEGIN
            L   <= '0';
            D50 <= '0';
            D25 <= '0';
            CASE ESTADO_ATUAL IS
                WHEN INIT =>
                    CASE A IS
                        WHEN "00" =>   PROXIMO_ESTADO <= INIT;
                        WHEN "01" =>   PROXIMO_ESTADO <= VLR_25;
                        WHEN "10" =>   PROXIMO_ESTADO <= VLR_50;
                        WHEN "11" =>   PROXIMO_ESTADO <= INIT;
                        WHEN OTHERS => PROXIMO_ESTADO <= INIT;
                    END CASE;
                WHEN VLR_25 =>  
                    CASE A IS
                        WHEN "00" =>   PROXIMO_ESTADO <= VLR_25;
                        WHEN "01" =>   PROXIMO_ESTADO <= VLR_50;
                        WHEN "10" =>   PROXIMO_ESTADO <= VLR_75;
                        WHEN "11" =>   PROXIMO_ESTADO <= DEVOLVE_25;
                        -- EM CASO DE ALGUM DEFEITO, A MÁQUINA IRÁ DEVOLVER OS 25 CENTAVOS
						WHEN OTHERS => PROXIMO_ESTADO <= DEVOLVE_25; 
                    END CASE;
                WHEN VLR_50 =>
                    CASE A IS
                        WHEN "00" =>   PROXIMO_ESTADO <= VLR_50;
                        WHEN "01" =>   PROXIMO_ESTADO <= VLR_75;
                        WHEN "10" =>   PROXIMO_ESTADO <= VLR_100;
                        WHEN "11" =>   PROXIMO_ESTADO <= DEVOLVE_50;
                        -- EM CASO DE ALGUM DEFEITO, A MÁQUINA IRÁ DEVOLVER OS 50 CENTAVOS
						WHEN OTHERS => PROXIMO_ESTADO <= DEVOLVE_50; 
                    END CASE;                                 -- 
                WHEN VLR_75 =>  
                    CASE A is
                        WHEN "00" =>   PROXIMO_ESTADO <= VLR_75;
                        WHEN "01" =>   PROXIMO_ESTADO <= VLR_100;
                        WHEN "10" =>   PROXIMO_ESTADO <= VLR_125;
                        WHEN "11" =>   PROXIMO_ESTADO <= DEVOLVE_75;
                        -- EM CASO DE ALGUM DEFEITO, A MÁQUINA IRÁ DEVOLVER OS 75 CENTAVOS
						WHEN OTHERS => PROXIMO_ESTADO <= DEVOLVE_75; 
                    END CASE;
                --PARA TODOS OS DEMAIS CASOS, O PROXIMO ESTADO SEMPRE SERA 
				--INIT. ASSIM QUE A MAQUINA CONSIGA 1 REAL OU SEJA SOLICITADO 
				--A DEVOLUCAO, SÓ SERÁ ACEITO NOVOS DEPÓSITOS APÓS A MÁQUINA VOLTAR
				--AO ESTADO INICIAL
				WHEN VLR_100 =>  
                    PROXIMO_ESTADO <= INIT;                             
                    L   <= '1'; -- LIBERA O REFRI                       
                    WHEN VLR_125 =>                                     
                    PROXIMO_ESTADO <= INIT;                             
                    L   <= '1';   -- LIBERA O REFRI
                    D25 <= '1';   -- DEVOLVE 25 CENTAVOS
                WHEN DEVOLVE_75 =>  
                    PROXIMO_ESTADO <= INIT;
                    D50 <= '1'; -- DEVOLVE 50 CENTAVOS
                    D25 <= '1'; -- DEVOLVE 25 CENTAVOS
                WHEN DEVOLVE_50 =>  
                    PROXIMO_ESTADO <= INIT;
                    D50 <= '1'; -- DEVOLVE 50 CENTAVOS
                WHEN DEVOLVE_25 =>  
                    PROXIMO_ESTADO <= INIT;
                    D25 <= '1'; -- DEVOLVE 25 CENTAVOS
            END CASE;
        END PROCESS PROCESSO_COMBINACIONAL;
END ARC_MAQ_MOORE_REFRI;