checker z08_checker (
	clk,
	rst,
	tx,
	rx
);

default clocking @(posedge clk);
endclocking

assert property (

	rst |=> (!tx && !rx)[*3]

);

endchecker
