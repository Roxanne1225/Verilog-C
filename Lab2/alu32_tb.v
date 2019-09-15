//implement a test bench for your 32-bit ALU
module alu32_test;
    reg [31:0] A = 0, B = 0;
    reg [2:0] control = 0;

    initial begin
        $dumpfile("alu32.vcd");
        $dumpvars(0, alu32_test);

             A = 8; B = 4; control = `ALU_ADD; // try adding 8 and 4
        # 10 A = 2; B = 5; control = `ALU_SUB; // try subtracting 5 from 2
        //A = 8; B = 4; control = `ALU_ADD; // try adding 8 and 4
        //# 10 A = 2; B = 5; control = `ALU_SUB; // try subtracting 5 from 2
        # 10 A = 5; B = 2; control = `ALU_SUB; // try subtracting 2 from 5
        # 10 A = 5; B = 8; control = `ALU_AND; // try 5 and 8
        # 10 A = 5; B = 8; control = `ALU_OR; // try 5 or 8
        # 10 A = 5; B = 8; control = `ALU_NOR; // try 5 nor 8
        # 10 A = 5; B = 8; control = `ALU_XOR; // try 5 xor 8
        # 10 A = 2; B = 2; control = `ALU_SUB; // try subtracting 2 from 2 = 0
        # 10 A = 36; B = 2147483632; control = `ALU_SUB; // try subtracting 2147483632 from 36 has negative=1 and overflow=0
        # 10 A = 899; B = 478; control = `ALU_ADD; // try adding 899 and 478
        # 10 A = -899; B = -478; control = `ALU_ADD; // try adding -899 and -478
        # 10 A = 899; B = -2147483632; control = `ALU_SUB; // try subtracting 2147483632 from 899
        // add more test cases here!

        # 10 $finish;
    end

    wire [31:0] out;
    wire overflow, zero, negative;
    alu32 a(out, overflow, zero, negative, A, B, control);
endmodule // alu32_test
