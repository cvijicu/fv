clear -all
analyze -sv09 z01_checker.sv bind.sv
analyze -vhdl z01.vhd
elaborate -vhdl -top z01
clock clk
reset rst
prove -bg -all
