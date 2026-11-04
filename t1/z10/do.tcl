clear -all
analyze -sv09 z10_checker.sv bind.sv
analyze -vhdl z10.vhd
elaborate -vhdl -top z10
clock clk
reset rst
prove -bg -all
