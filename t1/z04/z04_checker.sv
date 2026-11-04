checker z04_checker (
	clk,
	rst,
	cfg_en,
	mode
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (
	$changed(mode) |-> cfg_en
);

endchecker


