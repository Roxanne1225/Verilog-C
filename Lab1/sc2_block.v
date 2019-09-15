// Complete the sc2_block module in this file
// Don't put any code in this file besides the sc2_block

module sc2_block(s, cout, a, b, cin);

//my code starts here
    output s, cout;
    input a, b, cin;
    wire sca, scb, sccin;

    //a, b go through sc_block
    sc_block sc1(sca, scb, a, b);

    //output "s" is sca goes through sc_block again
    sc_block sc2(s, sccin, sca, cin);


    //output cout is sccin "or" scb;
    or o1(cout, sccin, scb);


endmodule // sc2_block
