/*
2342. Max Sum of a Pair With Equal Sum of Digits - (DAILY - 12/02/2025)

You are given a 0-indexed array nums consisting of positive integers. You 
can choose two indices i and j, such that i != j, and the sum of digits of 
the number nums[i] is equal to that of nums[j].
Return the maximum value of nums[i] + nums[j] that you can obtain over all
possible indices i and j that satisfy the conditions.

Example 1:

Input: nums = [18,43,36,13,7]
Output: 54
Explanation: The pairs (i, j) that satisfy the conditions are:
- (0, 2), both numbers have a sum of digits equal to 9, and their sum is 18 + 36 = 54.
- (1, 4), both numbers have a sum of digits equal to 7, and their sum is 43 + 7 = 50.
So the maximum sum that we can obtain is 54.
*/

import 'dart:math';

class Solution {
  int maximumSum(List<int> nums) {
    int maxSum = -1;
    Map<int, int> sums = {};
    
    for (int number in nums) {
      int digitSum = 0;
      int temp = number;
      
      while (temp > 0) {
        digitSum += temp % 10;
        temp ~/= 10;
      }
      
      if (sums.containsKey(digitSum)) {
        maxSum = max(maxSum, sums[digitSum]! + number);
      }
      
      sums[digitSum] = (sums[digitSum] ?? 0) > number 
        ? sums[digitSum]! 
        : number;
    }
    
    return maxSum;
  }
}
