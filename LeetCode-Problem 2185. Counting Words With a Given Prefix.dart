/*
2185. Counting Words With a Given Prefix - Daily(09/01/25)

You are given an array of strings words and a string pref.
Return the number of strings in words that contain pref as a prefix.
A prefix of a string s is any leading contiguous substring of s.

Example 1:

Input: words = ["pay","attention","practice","attend"], pref = "at"
Output: 2
Explanation: The 2 strings that contain "at" as a prefix are: "attention" and "attend".
*/

class Solution {
  int prefixCount(List<String> words, String pref) {
    int prefLength = pref.length;
    int count = 0;
    words.forEach((word) {
        if(word.length >= prefLength && word.substring(0,prefLength) == pref) {
            count++;
        }
    });

    return count;
  }
}
