-- Experimento 04 - Questão 02
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 02/12/2024

-- Entrada - 7 bits (A,B,C,D,E,F,G)
-- Saída   - 1 bit  (Z)

-- Função - Z = FG + ABCD!E!FG + !A!B!C!D!E!FG + A!BCEF!G + ABCDE!F!G + A!B!CDE!F!G

-- Usar apenas UM decoder 4x16, UM mux 8x1 e quantas OU forem necessárias 

-- 1a etapa - montar o mux 8x1 usando as entradas E,F e G como signal do Mux

-- S(2)=E;S(1)=F;S(0)=G;

-- D(7)=1 D(6)=A!BC  D(5)=0             D(4)=ABCD+A!B!CD
-- D(3)=1 D(2)=!ABCD D(1)=ABCD+!A!B!C!D D(0)=0
-- 
-- 
-- 

-- 2a etapa - associar saidas do decoder com o mux 

-- A(3)=A   A(2)=B  A(1)=C  A(0)=D

-- Y_DEC(0 )=!A!B!C!D     Y_DEC(1 )=!A!B!CD    Y_DEC(2 )=!A!BC!D    Y_DEC(3 )=!A!BCD
-- Y_DEC(4 )=!AB!C!D      Y_DEC(5 )=!AB!CD     Y_DEC(6 )=!ABC!D     Y_DEC(7 )=!ABCD
-- Y_DEC(8 )=A!B!C!D      Y_DEC(9 )=A!B!CD     Y_DEC(10)=A!BC!D     Y_DEC(11)=A!BCD
-- Y_DEC(12)=AB!C!D       Y_DEC(13)=AB!CD      Y_DEC(14)=ABC!D      Y_DEC(15)=ABCD 

-- D(7)=1  D(6)=A(10)+A(11) D(5)=0           D(4)=A(15)+A(9)
-- D(3)=1  D(2)=A(7)        D(1)=A(15)+A(0)  D(0)=0

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY CIRCUITO_E04Q02 IS
	PORT(A,B,C,D,E,F,G: IN STD_LOGIC;
	     Z:            OUT STD_LOGIC);
END CIRCUITO_E04Q02;

ARCHITECTURE ARC_CIRCUITO_E04Q02 OF CIRCUITO_E04Q02 IS
-- Multiplexador 8x1 do Experimento 03 Questão 01
COMPONENT MUX8X1 IS	 
	PORT (S: IN STD_LOGIC_VECTOR (2 DOWNTO 0);       -- SELETOR 3 BITS
	      D: IN STD_LOGIC_VECTOR (7 DOWNTO 0);       -- ENTRADA 8 BITS
      	  Y_MUX: OUT STD_LOGIC);                         -- SAÍDA
END COMPONENT;

--Decodificador 4x16 do Experimento 03 Questão 02
COMPONENT DEC4X16 IS
	PORT (A: IN STD_LOGIC_VECTOR   (3 DOWNTO 0);               -- ENTRADA 4 BITS
      	  Y_DEC: OUT STD_LOGIC_VECTOR (15 DOWNTO 0));          -- SAÍDA 16 BITS
END COMPONENT;

-- Porta OR
COMPONENT PORTA_OR IS
	PORT(ENTRADA_1, ENTRADA_2: IN STD_LOGIC;
		 SAIDA_OR:   OUT STD_LOGIC);
END COMPONENT;

SIGNAL SELETOR_MUX: STD_LOGIC_VECTOR(2 DOWNTO 0); -- Seletores do Multiplexador: E,F,G
SIGNAL SELETOR_DEC: STD_LOGIC_VECTOR(3 DOWNTO 0); -- Seletores do Decoder: A,B,C,D
SIGNAL BARRAMENTO_MUX: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL BARRAMENTO_DEC: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL D10_OR_D11, D15_OR_D9, D15_OR_D0: STD_LOGIC;

BEGIN 
DECODIFICADOR: DEC4X16 PORT MAP (SELETOR_DEC,BARRAMENTO_DEC);
MULTIPLEXADOR: MUX8X1  PORT MAP (SELETOR_MUX,BARRAMENTO_MUX,Z);

OR01: PORTA_OR PORT MAP (BARRAMENTO_DEC(10),BARRAMENTO_DEC(11),D10_OR_D11);
OR02: PORTA_OR PORT MAP (BARRAMENTO_DEC(15),BARRAMENTO_DEC(9),D15_OR_D9);
OR03: PORTA_OR PORT MAP (BARRAMENTO_DEC(15),BARRAMENTO_DEC(0),D15_OR_D0);

-- SELETOR DO DECODER: A,B,C,D
SELETOR_DEC(3) <= A;
SELETOR_DEC(2) <= B;
SELETOR_DEC(1) <= C;
SELETOR_DEC(0) <= D;

-- SELETOR DO MUX: E,F,G
SELETOR_MUX(2) <= E;
SELETOR_MUX(1) <= F;
SELETOR_MUX(0) <= G;

BARRAMENTO_MUX(7) <= '1'; 
BARRAMENTO_MUX(6) <= D10_OR_D11;
BARRAMENTO_MUX(5) <= '0';
BARRAMENTO_MUX(4) <= D15_OR_D9; 
BARRAMENTO_MUX(3) <= '1';
BARRAMENTO_MUX(2) <= BARRAMENTO_DEC(7);
BARRAMENTO_MUX(1) <= D15_OR_D0;
BARRAMENTO_MUX(0) <= '0';
END ARC_CIRCUITO_E04Q02;