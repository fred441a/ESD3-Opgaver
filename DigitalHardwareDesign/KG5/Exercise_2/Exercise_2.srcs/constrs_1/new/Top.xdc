set_property PACKAGE_PIN G17 [get_ports {LED[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[0]}]
set_property PACKAGE_PIN G19 [get_ports {LED[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[1]}]
set_property PACKAGE_PIN N18 [get_ports {LED[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[2]}]
set_property PACKAGE_PIN L18 [get_ports {LED[3]}]
set_property PACKAGE_PIN H17 [get_ports {LED[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[4]}]
set_property PACKAGE_PIN H19 [get_ports {LED[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[5]}]
set_property PACKAGE_PIN J19 [get_ports {LED[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[6]}]
set_property PACKAGE_PIN K18 [get_ports {LED[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[7]}]
set_property PACKAGE_PIN A17 [get_ports ONLED]
set_property IOSTANDARD LVCMOS33 [get_ports ONLED]
set_property PACKAGE_PIN L17 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]
create_interface interface_1
set_property INTERFACE interface_1 [get_ports { CLK }]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets CLK_IBUF]

