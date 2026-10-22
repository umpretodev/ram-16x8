## Template para a Boolean Board (Vivado).
## Preencha PACKAGE_PIN de cada sinal com o número do pino do manual da placa.

## din[7:0] -> SW0..SW7
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports {din[0]}]
## addr[3:0] -> SW8..SW11
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports {addr[0]}]
## enable -> SW12
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports enable]
## clear -> SW13
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports clear]
## clk -> BTN0
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports clk]
## dout[7:0] -> LD0..LD7
# set_property -dict {PACKAGE_PIN <pino> IOSTANDARD LVCMOS33} [get_ports {dout[0]}]

## Botão usado como clock não está em pino dedicado: sem esta linha o place falha.
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets clk_IBUF]
