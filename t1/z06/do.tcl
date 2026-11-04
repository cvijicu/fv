clear -all
analyze -sv09 z06_checker.sv bind.sv
analyze -vhdl z06.vhd
elaborate -vhdl -top z06
clock clk
reset rst
prove -bg -all
