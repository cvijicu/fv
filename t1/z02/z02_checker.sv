checker z02_checker (
	clk,
	rst,
	req,
	ack
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (
	ack |-> $past(req)
);

endchecker


