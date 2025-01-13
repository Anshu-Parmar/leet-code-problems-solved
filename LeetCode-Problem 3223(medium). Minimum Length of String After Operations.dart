/*
3223. Minimum Length of String After Operations - Daily(13/01/25)

You are given a string s.
You can perform the following process on s any number of times:
Choose an index i in the string such that there is at least one character to the left of index i that is equal to s[i], and at least one character to the right that is also equal to s[i].
Delete the closest character to the left of index i that is equal to s[i].
Delete the closest character to the right of index i that is equal to s[i].
Return the minimum length of the final string s that you can achieve.

Example 1:
Input: s = "abaacbcbb"
Output: 5

Explanation:
We do the following operations:
Choose index 2, then remove the characters at indices 0 and 3. The resulting string is s = "bacbcbb".
Choose index 3, then remove the characters at indices 0 and 5. The resulting string is s = "acbcb".
*/

class Solution {
  int minimumLength(String s) {
    Map<String, int> hash = {};
    for(int i=0; i<s.length; i++) {
        if(hash[s[i]] != null) {
            hash[s[i]] = hash[s[i]]! + 1;
        } else {
            hash[s[i]] = 1;
        }
    }
    int ans = 0;
    hash.forEach((k, v) {
        int count = v;
        while (count >= 3) {
            count -= 2;
        }
        ans += count;
    });
    return ans;
  }
}
