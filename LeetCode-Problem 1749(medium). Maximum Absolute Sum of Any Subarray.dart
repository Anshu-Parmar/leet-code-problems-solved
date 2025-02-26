/*
1749. Maximum Absolute Sum of Any Subarray - Daily(26/02/25)

You are given an integer array nums. The absolute sum of a subarray [numsl, 
numsl+1, ..., numsr-1, numsr] is abs(numsl + numsl+1 + ... + numsr-1 + numsr).
Return the maximum absolute sum of any (possibly empty) subarray of nums.
Note that abs(x) is defined as follows:
If x is a negative integer, then abs(x) = -x.
If x is a non-negative integer, then abs(x) = x.
 
Example 1:

Input: nums = [1,-3,2,3,-4]
Output: 5
Explanation: The subarray [2,3] has absolute sum = abs(2+3) = abs(5) = 5.
*/

class Solution {
  int maxAbsoluteSum(List<int> nums) {
    int min_pre = 0;
    int max_pre = 0;
    int cur = 0;
    int res = 0;

    for(int n in nums) {
        cur += n;
        res = max(res, max((cur - min_pre).abs(), (cur - max_pre).abs()));
        min_pre = min(min_pre, cur);
        max_pre = max(max_pre, cur);
    }
    return res;
  }
}
