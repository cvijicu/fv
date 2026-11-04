checker z01_checker (
	clk,
	rst,
	full,
	push,
	ovf
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (
	full && push |=> ovf
);

endchecker


