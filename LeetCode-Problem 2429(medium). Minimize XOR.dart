/*
2429. Minimize XOR - Daily(15/01/25)

Given two positive integers num1 and num2, find the positive integer x such that:
x has the same number of set bits as num2, and
The value x XOR num1 is minimal.
Note that XOR is the bitwise XOR operation.
Return the integer x. The test cases are generated such that x is uniquely determined.
The number of set bits of an integer is the number of 1's in its binary representation.

Example 1:

Input: num1 = 3, num2 = 5
Output: 3
Explanation:
The binary representations of num1 and num2 are 0011 and 0101, respectively.
The integer 3 has the same number of set bits as num2, and the value 3 XOR 3 = 0 is minimal.
*/

class Solution {
  int minimizeXor(int num1, int num2) {
    int countBits(int n) {
        int res = 0;
        while (n > 0) {
            res += 1 & n;
            n = n >> 1;
        }
        return res;
    }

    int bit1 = countBits(num1);
    int bit2 = countBits(num2);

    int x = num1;
    int i = 0;

    while (bit1 > bit2) {
        if(x & (1 << i) != 0) {
            bit1 --;
            x ^= 1 << i;
        }
        i ++;
    }

    while (bit1 < bit2) {
        if(x & (1 << i) == 0) {
            bit1 ++;
            x |= 1 << i;
        }
        i ++;
    }

    return x;
  }
}
