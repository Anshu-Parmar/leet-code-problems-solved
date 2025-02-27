/*
873. Length of Longest Fibonacci Subsequence - Daily(27/02/25)

A sequence x1, x2, ..., xn is Fibonacci-like if:
  n >= 3
  xi + xi+1 == xi+2 for all i + 2 <= n
Given a strictly increasing array arr of positive integers forming a sequence, return 
the length of the longest Fibonacci-like subsequence of arr. If one does not exist, return 0.

A subsequence is derived from another sequence arr by deleting any number of elements (including 
none) from arr, without changing the order of the remaining elements. For example, [3, 5, 8] is 
a subsequence of [3, 4, 5, 6, 7, 8].

Example 1:
Input: arr = [1,2,3,4,5,6,7,8]
Output: 5
Explanation: The longest subsequence that is fibonacci-like: [1,2,3,5,8].
*/

//GREDDY APPROACH - (O(n² log₂N) - where N is length of subarray)
class Solution {
  int lenLongestFibSubseq(List<int> arr) {
    int res = 0;
    Set<int> setArr = {...arr};

    for(int i = 0; i<arr.length; i++) {
        for(int j = i+1; j<arr.length; j++) {
            int prev = arr[i];
            int cur = arr[j];
            int nxt = prev + cur;
            int length = 2;
            while(setArr.contains(nxt)) {
                length += 1;
                prev = cur;
                cur = nxt;
                nxt = prev + cur;
                res = max(res, length);
            }
        }
    }
    return res;
  }
}

//DYNAMIC PROGRAMMING - (O(n²)) - but worse runtime and memory usage than greedy approach
class Solution {
  int lenLongestFibSubseq(List<int> arr) {
    int res = 0;
    Map<int, int> arrMap = {for (int i = 0; i < arr.length; i++) arr[i]: i};
    int arrLength = arr.length - 1;
    Map<(int, int), int> dp = {};

    for(int i = arrLength; i>-1; i--) {
        for(int j = arrLength; j>i; j--) {
            int prev = arr[i];
            int cur = arr[j];
            int nxt = prev + cur;
            int length = 2;

            if (arrMap.containsKey(nxt)) {
                length = 1 + (dp[(j, arrMap[nxt])] ?? 2);
                res = max(res, length);
            }
            dp[(i, j)] = length;
        }
    }
    return res > 2 ? res : 0;
  }
}
