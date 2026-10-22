SRC = src/mem_pkg.vhd src/decoder4x16.vhd src/reg8.vhd src/mux16x1.vhd src/ram16x8.vhd
TB  = tb/tb_ram.vhd
STD ?= 08

.PHONY: sim wave clean
sim:
	ghdl -a --std=$(STD) $(SRC) $(TB)
	ghdl -e --std=$(STD) tb_ram
	ghdl -r --std=$(STD) tb_ram

wave: sim
	ghdl -r --std=$(STD) tb_ram --wave=onda.ghw
	gtkwave onda.ghw

clean:
	rm -f *.cf *.ghw
