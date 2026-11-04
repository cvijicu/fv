clear -all
analyze -sv09 z07_checker.sv bind.sv
analyze -vhdl z07.vhd
elaborate -vhdl -top z07
clock clk
reset rst
prove -bg -all
