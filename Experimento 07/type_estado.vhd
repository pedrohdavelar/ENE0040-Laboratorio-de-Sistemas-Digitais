library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package type_estado is
TYPE ESTADO IS (INIT, VLR_25, VLR_50, VLR_75, VLR_100, VLR_125, DEVOLVE_75, DEVOLVE_50, DEVOLVE_25);
end package type_estado;