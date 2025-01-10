/*
916. Word Subsets - Daily(10/01/25)

You are given two string arrays words1 and words2.
A string b is a subset of string a if every letter in b occurs in a including multiplicity.
For example, "wrr" is a subset of "warrior" but is not a subset of "world".
A string a from words1 is universal if for every string b in words2, b is a subset of a.
Return an array of all the universal strings in words1. You may return the answer in any order.

Example 1:

Input: words1 = ["amazon","apple","facebook","google","leetcode"], words2 = ["e","o"]
Output: ["facebook","google","leetcode"]
*/

class Solution {
  List<String> wordSubsets(List<String> words1, List<String> words2) {
    final maxFreqWords2 = List<int>.filled(26, 0);
    for (final word in words2) {
      _updateMaxFrequency(maxFreqWords2, _getFrequency(word));
    }

    return words1.where((word) {
      final freqWords1 = _getFrequency(word);
      return _isSubset(freqWords1, maxFreqWords2);
    }).toList();
  }

  List<int> _getFrequency(String word) {
    final frequency = List<int>.filled(26, 0);
    for (final char in word.runes) {
      frequency[char - 'a'.codeUnitAt(0)]++;
    }
    return frequency;
  }

  void _updateMaxFrequency(List<int> maxFreq, List<int> currentFreq) {
    for (int i = 0; i < 26; i++) {
      maxFreq[i] = maxFreq[i] > currentFreq[i] ? maxFreq[i] : currentFreq[i];
    }
  }

  bool _isSubset(List<int> freqWords1, List<int> freqWords2) {
    for (int i = 0; i < 26; i++) {
      if (freqWords1[i] < freqWords2[i]) {
        return false;
      }
    }
    return true;
  }
}
