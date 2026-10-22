library ieee;
use ieee.std_logic_1164.all;
entity reg8 is
  port (clk, clear, load : in  std_logic;
        d                : in  std_logic_vector(7 downto 0);
        q                : out std_logic_vector(7 downto 0));
end entity;
architecture rtl of reg8 is
begin
  process(clk, clear)
  begin
    if clear = '1' then
      q <= (others => '0');
    elsif rising_edge(clk) then
      if load = '1' then
        q <= d;
      end if;  -- sem load: mantém o valor (retenção)
    end if;
  end process;
end architecture;
