/*
2161. Partition Array According to Given Pivot - Daily(03/03/25)

You are given a 0-indexed integer array nums and an integer pivot. Rearrange 
nums such that the following conditions are satisfied:

Every element less than pivot appears before every element greater than pivot.
Every element equal to pivot appears in between the elements less than and greater than pivot.
The relative order of the elements less than pivot and the elements greater than pivot is maintained.
More formally, consider every pi, pj where pi is the new position of the ith element 
and pj is the new position of the jth element. If i < j and both elements are smaller (or larger) 
than pivot, then pi < pj. Return nums after the rearrangement.

Example 1:

Input: nums = [9,12,5,10,14,3,10], pivot = 10
Output: [9,5,3,10,10,12,14]
Explanation: 
The elements 9, 5, and 3 are less than the pivot so they are on the left side of the array.
The elements 12 and 14 are greater than the pivot so they are on the right side of the array.
The relative ordering of the elements less than and greater than pivot is also maintained. [9, 5, 3] 
and [12, 14] are the respective orderings.
*/

//Time complexity: O(n) , Space complexity: O(n)
class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    List<int> less = [];
    List<int> greater = [];
    List<int> p = [];

    for(int n in nums) {
        if(n < pivot) {
            less.add(n);
        } else if (n > pivot) {
            greater.add(n);
        } else {
            p.add(n);
        }
    }

    return [...less, ...p, ...greater];
  }
}

//TWO POINTER APPROACH (Optimal space and time complexity)
class Solution {
  List<int> pivotArray(List<int> nums, int pivot) {
    int i = 0;
    int j = nums.length - 1;
    int i2 = 0;
    int j2 = nums.length - 1;
    List<int> res = List<int>.generate(nums.length, (_) => 0);

    while(i < nums.length) {
        if(nums[i] < pivot) {
            res[i2] = nums[i];
            i2 += 1;
        }
        if(nums[j] > pivot) {
            res[j2] = nums[j];
            j2 -= 1;
        }

        i += 1;
        j -= 1; 
    }

    while (i2 <= j2) {
        res[i2] = res[j2] = pivot;
        i2 += 1;
        j2 -= 1; 
    }

    return res;
  }
}
