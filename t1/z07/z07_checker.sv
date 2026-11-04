checker z07_checker (
	clk,
	rst,
	strobe
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (

	$rose(strobe) |-> strobe[*2] ##1 !strobe

);

endchecker
