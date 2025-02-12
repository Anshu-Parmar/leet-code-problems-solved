/*
3174. Clear Digits - (DAILY - 12/02/2025)

You are given a string s. Your task is to remove all digits by doing this operation repeatedly:
Delete the first digit and the closest non-digit character to its left. Return the resulting 
string after removing all digits.

Example 1:

Input: s = "abc"
Output: "abc"
Explanation: There is no digit in the string.
*/

List<String> result = [];

for(int i = 0; i<s.length; i++) {
    if((s.codeUnitAt(i) ^ 0x30) <= 9) {
        result.removeLast();
        continue;
    } else {
        result.add(s[i]);
    }
}
final String r = result.join();

return r;
