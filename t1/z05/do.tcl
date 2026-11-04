clear -all
analyze -sv09 z05_checker.sv bind.sv
analyze -vhdl z05.vhd
elaborate -vhdl -top z05
clock clk
reset rst
prove -bg -all
