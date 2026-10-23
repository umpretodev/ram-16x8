## Constraints para a Boolean Board (Vivado) - FPGA Spartan-7.
## Pinos lidos da documentação de GPIO da placa. Confira com o manual/xdc oficial antes de gravar.
## Todos os sinais da placa usam 3,3 V (LVCMOS33).

## din[7:0] -> SW0..SW7
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {din[0]}]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports {din[1]}]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {din[2]}]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {din[3]}]
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports {din[4]}]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {din[5]}]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports {din[6]}]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {din[7]}]

## addr[3:0] -> SW8..SW11
set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports {addr[0]}]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports {addr[1]}]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports {addr[2]}]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports {addr[3]}]

## enable -> SW12
set_property -dict {PACKAGE_PIN M1 IOSTANDARD LVCMOS33} [get_ports enable]

## clear -> SW13
set_property -dict {PACKAGE_PIN L1 IOSTANDARD LVCMOS33} [get_ports clear]

## clk (clock manual) -> BTN0
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports clk]

## dout[7:0] -> LD0..LD7
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {dout[0]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {dout[1]}]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {dout[2]}]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports {dout[3]}]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports {dout[4]}]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports {dout[5]}]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports {dout[6]}]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports {dout[7]}]

## Botão usado como clock não está em pino dedicado: sem esta linha o place falha.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
