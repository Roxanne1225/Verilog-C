/**
 * @file
 * Contains an implementation of the countOnes function.
 */

unsigned countOnes(unsigned input) {
	// TODO: write your code here

	unsigned right1 = 0x55555555;
	unsigned left1 = 0xAAAAAAAA;
	unsigned right2 = 0x33333333;
	unsigned left2 = 0xCCCCCCCC;
	unsigned right3 = 0x0F0F0F0F;
	unsigned left3 = 0xF0F0F0F0;
	unsigned right4 = 0x00FF00FF;
	unsigned left4 = 0xFF00FF00;
	unsigned right5 = 0x0000FFFF;
	unsigned left5 = 0xFFFF0000;

	unsigned right_counter = input & right1;
	unsigned left_counter = input & left1;

	unsigned shifted_left = left_counter >> 1;

	 input = shifted_left + right_counter;

	right_counter = input & right2;
 left_counter = input & left2;

	 shifted_left = left_counter >> 2;

	input = shifted_left + right_counter;

	right_counter = input & right3;
 left_counter = input & left3;

 shifted_left = left_counter >> 4;

	input = shifted_left + right_counter;

	right_counter = input & right4;
 left_counter = input & left4;

 shifted_left = left_counter >> 8;

	input = shifted_left + right_counter;

	right_counter = input & right5;
 left_counter = input & left5;

 shifted_left = left_counter >> 16;

	input = shifted_left + right_counter;





	return input;
}
