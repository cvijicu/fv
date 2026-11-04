checker z10_checker (
	clk,
	rst,
	start,
	stop
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (

	start |=> !stop

);

assert property (

	stop |=> !start

);

endchecker
