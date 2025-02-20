/*
1980. Find Unique Binary String - (DAILY - 20/02/2025)

Given an array of strings nums containing n unique binary strings each 
of length n, return a binary string of length n that does not appear in 
nums. If there are multiple answers, you may return any of them.

Example 1:

Input: nums = ["01","10"]
Output: "11"
Explanation: "11" does not appear in nums. "00" would also be correct.
*/

class Solution {
  String findDifferentBinaryString(List<String> nums) {
    int mask = 0;

    for(String binaryString in nums) {
        int countOnes = 0;

        for (int i = 0; i < binaryString.length; i++) {
            if (binaryString[i] == '1') {
                countOnes++;
            }
        }

        mask |= (1 << countOnes);
    }

    for (int i = 0; ; i++) { 
      if ((mask >> i & 1) == 0) {
        String ones = '1' * i;
        String zeros = '0' * (nums.length - i);
        return ones + zeros;
      }
    }
  }
}
