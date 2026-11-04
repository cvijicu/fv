checker z09_checker (
	clk,
	rst,
	ping,
	pong
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (

	ping |-> ##[1:3]pong 

);

endchecker
