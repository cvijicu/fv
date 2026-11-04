clear -all
analyze -sv09 z02_checker.sv bind.sv
analyze -vhdl z02.vhd
elaborate -vhdl -top z02
clock clk
reset rst
prove -bg -all
