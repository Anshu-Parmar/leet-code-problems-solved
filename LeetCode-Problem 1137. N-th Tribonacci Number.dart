/*
1137. N-th Tribonacci Number

The Tribonacci sequence Tn is defined as follows: 
T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
Given n, return the value of Tn.

Example 1:

Input: n = 4
Output: 4
Explanation:
T_3 = 0 + 1 + 1 = 2
T_4 = 1 + 1 + 2 = 4
*/

class Solution {
  int tribonacci(int n) {
    List<int> t = [0,1,1];

    if(n < 3) return t[n];

    for(int i = 3; i<=n; ++i) {
        t[i%3] = t[0] + t[1] + t[2];
    }

    return t[n%3];
  }
}
