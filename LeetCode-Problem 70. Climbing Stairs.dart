/*
70. Climbing Stairs

You are climbing a staircase. It takes n steps to reach the top.
Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Example 1:

Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
*/

//1. Recursive (Memoisation)
//Time complexity: O(n)
//Space complexity: O(n)
class Solution {
    Map<int, int> memo = {};
    int climbStairs(int n, ) {
        if(n <= 1) return 1;
        if (memo.containsKey(n)) {
            return memo[n]!;
        }
        int result = climbStairs(n - 1) + climbStairs(n - 2);
        memo[n] = result;
        return result;
    }
}

//2. DYNAMIC PROGRAMMING (Space Optimized)
//Time complexity: O(n)
//Space complexity: O(1)
class Solution {
    int climbStairs(int n) {
        int first = 1;
        int second = 1;

        for (int i=0; i<n-1;i++) {
            int temp = second;
            second = first + second;
            first = temp; 
        }
        return second;
    }
}

//3. MATHEMATICAL APPROACH (Using formula for fibonacci: Binet’s formula) (OPTIMIZED)
//Time complexity: O(logn)
//Space complexity: O(1)
import 'dart:math' as math;

class Solution {
  int climbStairs(int n) {
    double sqrt5 = math.sqrt(5);
    double phi = (1 + sqrt5) / 2;
    double psi = (1 - sqrt5) / 2;
    n++;
    return ((math.pow(phi, n) -
                    math.pow(psi, n)) / sqrt5).round();
  }
}
