#!/bin/sh
# Uso: ./sim.sh [93|08] [--wave]   (padrão: 08)
set -e
STD=${1:-08}
ghdl -a --std=$STD src/mem_pkg.vhd src/decoder4x16.vhd src/reg8.vhd src/mux16x1.vhd src/ram16x8.vhd tb/tb_ram.vhd
ghdl -e --std=$STD tb_ram
if [ "$2" = "--wave" ]; then
  ghdl -r --std=$STD tb_ram --wave=onda.ghw && gtkwave onda.ghw
else
  ghdl -r --std=$STD tb_ram
fi
