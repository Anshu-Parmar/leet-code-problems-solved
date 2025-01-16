/*
2425. Bitwise XOR of All Pairings - Daily(16/01/25)

You are given two 0-indexed arrays, nums1 and nums2, consisting of non-negative integers. 
There exists another array, nums3, which contains the bitwise XOR of all pairings of integers between nums1 and nums2 
(every integer in nums1 is paired with every integer in nums2 exactly once).
Return the bitwise XOR of all integers in nums3.

Example 1:

Input: nums1 = [2,1,3], nums2 = [10,2,5,0]
Output: 13
Explanation:
A possible nums3 array is [8,0,7,2,11,3,4,1,9,1,6,3].
The bitwise XOR of all these numbers is 13, so we return 13.
*/

///SOLUTION 1 - Brute Force - O(n.m)
class Solution {
  int xorAllNums(List<int> nums1, List<int> nums2) {
    int result = 0;

    for(int i=0; i < nums1.length; i++) {
        for (int j=0; j < nums2.length; j++) {
            result ^= (nums1[i] ^ nums2[j]);
        }
    }

    return result;
  }
}

///SOLUTION 2 - Optimal Time - O(n+m)
class Solution {
  int xorAllNums(List<int> nums1, List<int> nums2) {
    int result = 0;
    if (nums2.length % 2 == 1) {
        for(int number in nums1) {
            result ^= number;
        }
    }

    if (nums1.length % 2 == 1) {
        for(int number in nums2) {
            result ^= number;
        }
    }
    return result;
  }
}
