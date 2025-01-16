/*
338. Counting Bits
Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

Example 1:
Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0
1 --> 1
2 --> 10
*/

class Solution {
  int countOneBits(int i) {
    int sum = 0;
    while (i > 0) {
        i &= i-1;
        sum++;
    }
    return sum;
  }

  List<int> countBits(int n) {
    List<int> result = List.filled(n+1, 0);

    for(int i=0; i<=n; i++) {
        result[i] = countOneBits(i);
    }
    return result;
  }
}
