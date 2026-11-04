clear -all
analyze -sv09 z08_checker.sv bind.sv
analyze -vhdl z08.vhd
elaborate -vhdl -top z08
clock clk
reset rst
prove -bg -all
