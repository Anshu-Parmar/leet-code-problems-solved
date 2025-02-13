/*
7. Reverse Integer

Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes 
the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.
Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

Example 1:

Input: x = 123
Output: 321
*/

class Solution {
  int reverse(int x) {
    int result = 0;
    int sign = x < 0 ? -1 : 1;
    x = x.abs();

    while (x != 0) {
        int lastDigit = x % 10;
        result = result * 10 + lastDigit;
        x  ~/= 10; 
    }
    result *= sign;

    if(result < -2147483648 || result > 2147483647) {
        return 0;
    } else {
        return result;
    }
  }
}
