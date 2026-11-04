clear -all
analyze -sv09 z04_checker.sv bind.sv
analyze -vhdl z04.vhd
elaborate -vhdl -top z04
clock clk
reset rst
prove -bg -all
