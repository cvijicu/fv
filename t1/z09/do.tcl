clear -all
analyze -sv09 z09_checker.sv bind.sv
analyze -vhdl z09.vhd
elaborate -vhdl -top z09
clock clk
reset rst
prove -bg -all
