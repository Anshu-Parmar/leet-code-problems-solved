/*
1408. String Matching in an Array - Daily(07/01/24)

Given an array of string words, return all strings in words that is a substring of another word. 
You can return the answer in any order.
A substring is a contiguous sequence of characters within a string

Example 1:

Input: words = ["mass","as","hero","superhero"]
Output: ["as","hero"]
Explanation: "as" is substring of "mass" and "hero" is substring of "superhero".
["hero","as"] is also a valid answer.
*/

class Solution {
  List<String> stringMatching(List<String> words) {
    List<String> result = [];

    for(int i=0; i< words.length; i++) {
        for(int j=0; j< words.length; j++) {
            if(i==j) continue;

            if(words[j].contains(words[i])) {
                result.add(words[i]);
                break;
            }
        }
    }

    return result;
  }
}
