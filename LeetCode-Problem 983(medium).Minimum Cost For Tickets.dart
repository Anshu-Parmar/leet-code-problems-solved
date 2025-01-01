//983. Minimum Cost For Tickets - (DAILY - 31/12/2024)
/*
You have planned some train traveling one year in advance. The days of the year in which you will travel are given as an integer array days. Each day is an integer from 1 to 365.

Train tickets are sold in three different ways:

a 1-day pass is sold for costs[0] dollars,
a 7-day pass is sold for costs[1] dollars, and
a 30-day pass is sold for costs[2] dollars.
The passes allow that many days of consecutive travel.

For example, if we get a 7-day pass on day 2, then we can travel for 7 days: 2, 3, 4, 5, 6, 7, and 8.
Return the minimum number of dollars you need to travel every day in the given list of days.
*/

import "dart:math";

class Solution {
  int mincostTickets(List<int> days, List<int> costs) {
    Map<int, int> dp = {
        days.length: 0
    };

    final prices = Map.fromIterables(costs, [1,7,30]);

    int dfs(int i) {
        if(dp.containsKey(i)) {
            return dp[i] ?? 0;
        }

        dp[i] = double.maxFinite.toInt();
        int j = i;
        prices.forEach((cost, duration) {
            while (j< days.length && days[j] < days[i] + duration) {
                j += 1;
            }
            dp[i] = min(dp[i]!, cost + dfs(j));
        });
        return dp[i]!;
    }
    return dfs(0);
  }
}
