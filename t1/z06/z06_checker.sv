checker z06_checker (
	clk,
	rst,
	temp_hi,
	alarm
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (

	alarm |-> $past(temp_hi)

);

endchecker
