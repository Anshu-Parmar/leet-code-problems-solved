/*
213. House Robber II

You are a professional robber planning to rob houses along a street. 
Each house has a certain amount of money stashed. All houses at this
place are arranged in a circle. That means the first house is the neighbor 
of the last one. Meanwhile, adjacent houses have a security system connected, 
and it will automatically contact the police if two adjacent houses were 
broken into on the same night.

Given an integer array nums representing the amount of money of each 
house, return the maximum amount of money you can rob tonight without 
alerting the police.


Example 1:

Input: nums = [2,3,2]
Output: 3
Explanation: You cannot rob house 1 (money = 2) and then rob house 3 
(money = 2), because they are adjacent houses.
*/

//DYNAMIC PROGRAMMING 
//TIME COMPLEXITY: O(n)
class Solution {
  int rob(List<int> nums) {
    return max(
        nums[0],
        max( 
            helper(nums.sublist(1)), 
            helper(nums.sublist(0, nums.length -1))
        ).toInt()
    ).toInt();
  }

  int helper(List<int> nums) {
    int rob1 = 0, rob2 = 0;

    for(int n in nums) {
        int temp = max(n+rob1, rob2);
        rob1 = rob2;
        rob2 = temp;
    }

    return rob2;
  }
}
