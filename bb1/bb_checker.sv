checker bb_checker (
	CLK,
	STALL,
	RST,
	OPCH,
	OPS,
	TEST,
	AB,
	BC,
	CD,
	ERR,
	REQ,
	ACK,
	BUSY,
	DONE,
	DATA
);

	default clocking @(posedge CLK);
	endclocking

	default disable iff RST;

	// assert #4: Kada je DONE aktivan, DATA je tada stabilan.
	a_data_stabilan: assert property ( DONE |-> $stable(DATA) );

	// assert #6: ERR nikada nije aktivan.
	a_err: assert property ( !ERR );

	// assert #7: OPS ima iskljucivo jedan ili nijedan bit sa vrednoscu 1 (onehot0).
	a_ops_onehot0: assert property ( $onehot0(OPS) );

	// assert #9: ako je STALL aktivan, OPS se ne menja.
	a_ops_stabilan: assert property ( STALL |=> $stable(OPS) );

	// cover #1: 4 ciklusa nakon OPS = 0100, OPS je ponovo 0100.
	c_ops_opet_0100: cover property ( OPS == 4'b0100 ##4 OPS == 4'b0100 );

endchecker
