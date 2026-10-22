library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decoder4x16 is
  port (addr : in  std_logic_vector(3 downto 0);
        sel  : out std_logic_vector(15 downto 0));
end entity;
architecture rtl of decoder4x16 is
begin
  process(addr)
  begin
    sel <= (others => '0');
    sel(to_integer(unsigned(addr))) <= '1';
  end process;
end architecture;
