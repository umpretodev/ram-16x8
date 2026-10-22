library ieee;
use ieee.std_logic_1164.all;
use work.mem_pkg.all;
entity ram16x8 is
  port (clk, enable, clear : in  std_logic;
        addr : in  std_logic_vector(3 downto 0);
        din  : in  std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0));
end entity;
architecture structural of ram16x8 is
  signal sel  : std_logic_vector(15 downto 0);
  signal we   : std_logic_vector(15 downto 0);
  signal data : mem_t;
begin
  u_dec : entity work.decoder4x16
    port map (addr => addr, sel => sel);
  gen_regs : for i in 0 to 15 generate
    we(i) <= sel(i) and enable;
    u_reg : entity work.reg8
      port map (clk => clk, clear => clear, load => we(i),
                d => din, q => data(i));
  end generate;
  u_mux : entity work.mux16x1
    port map (d => data, addr => addr, y => dout);
end architecture;
