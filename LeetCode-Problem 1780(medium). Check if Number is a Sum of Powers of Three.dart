/*
1780. Check if Number is a Sum of Powers of Three - Daily(04/03/25)

Given an integer n, return true if it is possible to represent n as 
the sum of distinct powers of three. Otherwise, return false.
An integer y is a power of three if there exists an integer x such that y == 3x.

Example 1:

Input: n = 12
Output: true
Explanation: 12 = 31 + 32

Example 3:

Input: n = 21
Output: false
*/

//BACKTRACKING APPROACH
class Solution {
  bool checkPowersOfThree(int n) {
    bool backtrack (int i, int curSum) {
        if(curSum == n) return true;

        if(curSum > n || pow(3, i) > n) return false;

        if (backtrack(i+1, (curSum + pow(3,i)).toInt())){
            return true;
        }
        return backtrack(i+1, curSum);
    }
    return backtrack(0,0);
  }
}

//MATH APPROACH
class Solution {
  bool checkPowersOfThree(int n) {
    int i = 0;

    while (pow(3, (i+1)) <= n) {
        i += 1;
    }

    while (i >= 0){
        int power = pow(3,i).toInt();
        if(power <= n) n -= power;
        //EARLY BREAK FROM THE LOOP REDUCES RUN TIME
        if(power <= n) return false;
      
        i -= 1;
    }

    return n == 0;
  }
}
