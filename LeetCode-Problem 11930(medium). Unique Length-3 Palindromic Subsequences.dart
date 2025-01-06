/*
1930. Unique Length-3 Palindromic Subsequences - (DAILY - 04/01/2025)

Given a string s, return the number of unique palindromes of length three that are a subsequence of s.
Note that even if there are multiple ways to obtain the same subsequence, it is still only counted once.
A palindrome is a string that reads the same forwards and backwards.
A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.
For example, "ace" is a subsequence of "abcde".

Example 1:

Input: s = "aabca"
Output: 3
Explanation: The 3 palindromic subsequences of length 3 are:
- "aba" (subsequence of "aabca")
- "aaa" (subsequence of "aabca")
- "aca" (subsequence of "aabca")
*/

class Solution {
  int countPalindromicSubsequence(String s) {
    Set result = Set();
    Set left = Set();
    List<String> characters = s.split('');
    Map<String, int> right = {};
    for (String letter in characters) {
        right[letter] = (right[letter] ?? 0) + 1;
    }

    for (String midChar in characters) {
        right[midChar] =  right[midChar]! != 0 ? right[midChar]! - 1 : 0;

        for(String c in left) {
            if(right[c]! > 0) {
                result.add((midChar,c));
            }
        }
        left.add(midChar);
    }
    return result.length;
  }
}
