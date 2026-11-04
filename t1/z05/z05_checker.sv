checker z05_checker (
	clk,
	rst,
	load,
	busy,
	done
);

default clocking @(posedge clk);
endclocking

default disable iff rst;

assert property (

	$fell(load) |-> busy[*2] ##1 done

);

endchecker
