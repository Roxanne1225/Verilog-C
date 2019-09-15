/**
 * @file
 * Contains an implementation of the extractMessage function.
 */

#include <iostream> // might be useful for debugging
#include <assert.h>
#include "extractMessage.h"

using namespace std;

char *extractMessage(const char *message_in, int length) {
   // Length must be a multiple of 8
   assert((length % 8) == 0);

   // allocates an array for the output
   char *message_out = new char[length];
   for (int i=0; i<length; i++) {
   		message_out[i] = 0;    // Initialize all elements to zero.
	}

	// TODO: write your code here

//std::cout << *message_in << '\n';
//message_out[1] = *message_in;

  // int numofblocks = length/8;
  // for (int block = 0; block < numofblocks; block++) {
  //   for (int i = 0; i < 8; i++) {
  //     unsigned emptybyte = 0x00;
  //     for (int j = 0; j < 8; j++) {
  //       emptybyte = *(message_in + block * 8 + j);
  //
  //     //  message_out[block] =
  //     }
  //   }
  // }


// //numofblocks: each block contains 8 characters
//   int numofblocks = length/8;
//   //look at each block seperately
//   for (int block = 0; block < numofblocks; block++) {
//
//     for (int bitshift = 0; bitshift < 8; bitshift++) {
//       unsigned emptybyte = 0x00;
//       unsigned
//       for (int charShift = 8; charShift >=0; charShift--) {
//         char currentChar = message_in[bitshift * block + charShift];
//         std::cout << bitshift * block + charShift << '\n';
//         std::cout << currentChar << '\n';
//         //unsigned outchar = (currentChar<<bitshift) &1;
//       }
//     }
//   }

  // //numofblocks: each block contains 8 characters
  //   int numofblocks = length/8;
  //   //look at each block seperately
  //   for (int block = 0; block < numofblocks; block++) {
  //
  //     for (int charShift = 7; charShift >=0; charShift--) {
  //       //unsigned emptybyte = 0x00;
  //       char currentChar = message_in[8*block + charShift];
  //       std::cout << 8*block + charShift << '\n';
  //       for (int bitshift = 0; bitshift < 8; bitshift++) {
  //
  //       //  std::cout << currentChar << '\n';
  //         unsigned currentBit = (currentChar<<bitshift) &1;
  //
  //
  //       }
  //     }
  //   }


  //numofblocks: each block contains 8 characters
    int numofblocks = length/8;
    //look at each block seperately
    for (int block = 0; block < numofblocks; block++) {

      for (int bitshift = 0; bitshift < 8; bitshift++) {
        unsigned emptybyte = 0x00;

        //std::cout << 8*block + charShift << '\n';
        for (int charShift = 7; charShift >=0; charShift--) {
          char currentChar = message_in[8*block + charShift];
        //  std::cout << currentChar << '\n';
          unsigned currentBit = (currentChar>>bitshift) &1;
          unsigned shifted_bit =  currentBit<<charShift;
          // std::cout << shifted_bit << '\n';
          emptybyte += shifted_bit;
      //  std::cout << emptybyte << '\n';

        }
        //  std::cout << emptybyte << '\n';
        message_out[block * 8 + bitshift] = emptybyte;
      }

    }



	return message_out;
}
