checker z03_checker (
	clk,
	rst,
	cs,
	rd,
	wr
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (
	rd |-> !wr
);

assert property (
	rd || wr |-> cs
);

endchecker


