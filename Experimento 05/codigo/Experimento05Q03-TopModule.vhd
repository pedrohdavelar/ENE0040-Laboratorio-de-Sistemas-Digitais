-- Experimento 05 - Quest�o 03
-- Aluno: Pedro Henrique Dias Avelar 241037112
-- Turma 08
-- Data: 11/12/2024

--Top Module

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY TOPMODULE IS
END TOPMODULE;

ARCHITECTURE TOPMODULE_ARC OF TOPMODULE IS

COMPONENT E05Q01 IS 
	PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	      S:  OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END COMPONENT;

COMPONENT E05Q02 IS
	PORT (A,B: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	      S:  OUT STD_LOGIC_VECTOR (4 DOWNTO 0));
END COMPONENT;

COMPONENT TESTBENCH IS
	PORT (S_DUT, S_GM: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
	      AT, BT:     OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END COMPONENT;

SIGNAL A_SIGNAL, B_SIGNAL: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL SOM_DUT, SOM_GM: STD_LOGIC_VECTOR (4 DOWNTO 0);

BEGIN

SOMADOR_DUT: E05Q01 PORT MAP(A_SIGNAL, B_SIGNAL, SOM_DUT);
SOMADOR_GML: E05Q02 PORT MAP(A_SIGNAL, B_SIGNAL, SOM_GM);
SOMADOR_TST: TESTBENCH PORT MAP(SOM_DUT, SOM_GM, A_SIGNAL, B_SIGNAL);

END TOPMODULE_ARC; 
