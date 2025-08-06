# Clock input from 100 MHz oscillator
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk}]

# Reset input (using SW0)
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {rst}]

# On-board USB-UART RX from PC1
set_property -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS33} [get_ports {UART_rxd}]

# PMOD TX output to FPGA2 (choose a PMOD pin, e.g., G5)
set_property -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS33} [get_ports {uart_tx_pmod}]
