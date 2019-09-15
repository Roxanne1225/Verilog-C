module keypad(valid, number, a, b, c, d, e, f, g);
   output 	valid;
   output [3:0] number;
   input 	a, b, c, d, e, f, g;
   wire ag,cg, beforevalid, eight, nine, seven, two, three, six, one, five, zero;

   // //valid is 0 when a,g are both 1 or when c,g are both 1
   // not va(valid, beforevalid);
   // or agorcg(beforevalid, ag, cg);//ag or cg is 1
   //
   // and agone(ag, a, g);//ag is 1 when a and g are both 1
   // and cgone(cg, c, g);

   //valid when one number is pressed
   or ovalid(valid, d, e, f,zero );
   and a0(zero, b, g);

  //  //first binary digit is 0 for zero through 7
  // and a0(zero, b, g);//when b and g are one then 0 is pressed
  // or o16(one_to_six, d, e);//when d or e is one then one of 1-6 is pressed
  // and aaf(af, a, f);//when a and f are one then 7 is pressed
  //
  // or o07(number[0], )

  //first binary digit is 1 for 8 and 9
  and a8(eight, b, f);//when b and f are 1 then 8 is pressed
  and a9(nine, c, f);
  or onum0(number[3], eight, nine);//first number is 1 when 8 or 9 is pressed

  //second binary digit is 1 for 4,5,6,7
  //7
  and a7(seven, a,f);
  //4,5,6(e is pressed) or 7
  or onum1(number[2], seven, e);

  //third binary digit is 1 for 2,3 and 6,7
  //2
  and a2(two, b, d);
  //3
  and a3(three, c, d);
  //6
  and a6(six, c, e);
  //7 is seven
  or onum2(number[1], two, three, six, seven);

  //fourth binary digit is 1 for 1, 3, 5, 7, 9
  //1
  and a1(one, a, d);
  //5
  and a5(five, b, e);
  or onum3(number[0], one, three, five, seven, nine);



endmodule // keypad
