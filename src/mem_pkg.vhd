library ieee;
use ieee.std_logic_1164.all;
package mem_pkg is
  type mem_t is array (0 to 15) of std_logic_vector(7 downto 0);
end package;
