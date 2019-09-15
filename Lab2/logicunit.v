// 00 -> AND, 01 -> OR, 10 -> NOR, 11 -> XOR
module logicunit(out, A, B, control);
    output      out;
    input       A, B;
    input [1:0] control;
    wire   w1,w2,w3,w4,wA,wB,wC,wD,not_control1,not_control0;

not n1(not_control1,control[1]);
not n0(not_control0,control[0]);

//check 00 and
and a1(wA,not_control1,not_control0, w1);
assign w1 = A & B;

//check 01 or
and a2(wB,not_control1,control[0], w2);
assign w2 = A | B;

//check 10 nor
and a3(wC,control[1],not_control0, w3);
assign w3 = A ~| B;

//check 11 xor
and a4(wD,control[1],control[0], w4);
assign w4 = A ^ B;

or o1(out,wA,wB,wC,wD);

endmodule // logicunit
