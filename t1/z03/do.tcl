clear -all
analyze -sv09 z03_checker.sv bind.sv
analyze -vhdl z03.vhd
elaborate -vhdl -top z03
clock clk
reset rst
prove -bg -all
