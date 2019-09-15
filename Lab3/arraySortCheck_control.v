
module arraySortCheck_control(sorted, done, load_input, load_index, select_index, go, inversion_found, end_of_array, clock, reset);
	output sorted, done, load_input, load_index, select_index;
	input go, inversion_found, end_of_array;
	input clock, reset;


	// wire sGarbage,sReady,sCheck,sSorted,sNotSorted;
	//
	// wire sGarbage_next = reset;
	// wire sReady_next = (sGarbage & go) | (sReady & go) | (sSorted & go) | (sNotSorted & go);
	// wire sCheck_next = (sReady & ~go) | (sCheck & ~inversion_found & ~end_of_array);
	// wire sSorted_next = (sCheck & ~inversion_found & end_of_array);
	// wire sNotSorted_next = (sCheck & inversion_found);
	//
	// dffe fsGarbage(sGarbage,sGarbage_next,clock,1'b1,1'b0);
	// dffe fsReady(sReady,sReady_next,clock,1'b1,reset);
	// dffe fsCheck(sCheck,sCheck_next,clock,1'b1,reset);
	// dffe fsSorted(sSorted,sSorted_next,clock,1'b1,reset);
	// dffe fsNotSorted(sNotSorted,sNotSorted_next,clock,1'b1,reset);
	//
	// assign sorted = sSorted;
	// assign done = sSorted | sNotSorted;
	// assign load_input = sCheck;
	// assign load_index = sCheck;
	// assign select_index = sCheck;
	wire sGarbage,sReady,sCheck,sSorted,sNotSorted;

	wire sGarbage_next = (sGarbage & ~go) | reset;
	wire sReady_next = ((sGarbage & go) | (sReady & go) | (sSorted & go) | (sNotSorted & go) )& ~reset;// | (sSorted & go) | (sNotSorted & go);
	wire sCheck_next = ((sReady & ~go & ~inversion_found) | (sCheck & ~inversion_found & ~end_of_array)) & ~reset;
	wire sSorted_next = ((sCheck & ~inversion_found & end_of_array) | (sSorted & ~go) )&~reset;
	wire sNotSorted_next = ((sCheck & inversion_found) | (sNotSorted & ~go ))& ~reset;


	dffe fsGarbage(sGarbage,sGarbage_next,clock,1'b1,1'b0);
	dffe fsReady(sReady,sReady_next,clock,1'b1,1'b0);
	dffe fsCheck(sCheck,sCheck_next,clock,1'b1,1'b0);
	dffe fsSorted(sSorted,sSorted_next,clock,1'b1,1'b0);
	dffe fsNotSorted(sNotSorted,sNotSorted_next,clock,1'b1,1'b0);

	// dffe fsGarbage(sGarbage,sGarbage_next,clock,1'b1,1'b0);
	// dffe fsReady(sReady,sReady_next,clock,1'b1,reset);
	// dffe fsCheck(sCheck,sCheck_next,clock,1'b1,reset);
	// dffe fsSorted(sSorted,sSorted_next,clock,1'b1,reset);
	// dffe fsNotSorted(sNotSorted,sNotSorted_next,clock,1'b1,reset);

	assign sorted = sSorted;
	assign done = sSorted | sNotSorted;
	assign load_input = sCheck;
	assign load_index = sCheck;
	assign select_index = sCheck;

endmodule
