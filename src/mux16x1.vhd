library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.mem_pkg.all;
entity mux16x1 is
  port (d    : in  mem_t;
        addr : in  std_logic_vector(3 downto 0);
        y    : out std_logic_vector(7 downto 0));
end entity;
architecture rtl of mux16x1 is
begin
  y <= d(to_integer(unsigned(addr)));
end architecture;
