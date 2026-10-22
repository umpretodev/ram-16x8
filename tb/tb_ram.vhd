library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity tb_ram is
end entity;
architecture sim of tb_ram is
  signal clk, enable, clear : std_logic := '0';
  signal addr : std_logic_vector(3 downto 0) := (others => '0');
  signal din  : std_logic_vector(7 downto 0) := (others => '0');
  signal dout : std_logic_vector(7 downto 0);
  -- valor de teste diferente para cada endereco
  function pattern(i : integer) return std_logic_vector is
  begin
    return std_logic_vector(to_unsigned(i * 11 + 7, 8));
  end function;
begin
  dut : entity work.ram16x8
    port map (clk => clk, enable => enable, clear => clear,
              addr => addr, din => din, dout => dout);
  stim : process
    variable erros : integer := 0;
    procedure pulso is  -- um aperto no botao de clock
    begin
      clk <= '1'; wait for 10 ns;
      clk <= '0'; wait for 10 ns;
    end procedure;
    procedure checa(a : integer; esperado : std_logic_vector; teste : string) is
    begin
      addr <= std_logic_vector(to_unsigned(a, 4));
      wait for 5 ns;  -- sem borda de clock
      if dout /= esperado then
        report teste & ": FALHOU no endereco " & integer'image(a) severity error;
        erros := erros + 1;
      end if;
    end procedure;
  begin
    -- T1: escrita em todos os enderecos
    enable <= '1';
    for i in 0 to 15 loop
      addr <= std_logic_vector(to_unsigned(i, 4));
      din  <= pattern(i);
      wait for 5 ns;
      pulso;
    end loop;
    enable <= '0';
    -- T2: leitura dos dados gravados
    for i in 0 to 15 loop
      checa(i, pattern(i), "T2 leitura");
    end loop;
    -- T3: leitura assincrona (troca addr sem clock)
    checa(3, pattern(3), "T3 leitura assincrona");
    checa(12, pattern(12), "T3 leitura assincrona");
    checa(0, pattern(0), "T3 leitura assincrona");
    -- T4: enable = 0 bloqueia a escrita
    din  <= x"00";
    addr <= "0101";
    wait for 5 ns;
    pulso;
    checa(5, pattern(5), "T4 enable");
    -- T5: retencao apos varios clocks sem escrita
    for i in 0 to 15 loop
      addr <= std_logic_vector(to_unsigned(i, 4));
      din  <= x"FF";
      pulso;
    end loop;
    for i in 0 to 15 loop
      checa(i, pattern(i), "T5 retencao");
    end loop;
    -- T6: clear zera tudo (sem clock)
    clear <= '1'; wait for 10 ns;
    clear <= '0'; wait for 10 ns;
    for i in 0 to 15 loop
      checa(i, x"00", "T6 clear");
    end loop;
    if erros = 0 then
      report "RESULTADO: todos os testes passaram" severity note;
    else
      report "RESULTADO: " & integer'image(erros) & " falha(s)" severity error;
    end if;
    wait;
  end process;
end architecture;
