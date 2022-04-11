//: [Previous](@previous)

/* Question:
 https://leetcode.com/problems/maximum-subarray/description/

 Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.

 Kadane's algorithm:
 https://www.youtube.com/watch?v=86CQq3pKSUw&feature=youtu.be
 */

import Foundation

func maxSubArrayValue(_ array: [Int]) -> Int {
  guard var localMax = array.first else { return 0 }
  var globalMax = localMax

  for val in array.suffix(from: 1) {
    localMax = max(val, localMax + val)
    globalMax = max(globalMax, localMax)
  }

  return globalMax
}

func maxSubArray(_ array: [Int]) -> [Int] {
  guard var localMax = array.first else { return [] }
  var globalMax = localMax
  var lastMaxIndex = 0

  for i in 1..<array.count {
    let val = array[i]
    localMax = max(val, localMax + val)
//    globalMax = max(globalMax, localMax)

    if localMax > globalMax {
      globalMax = localMax
      lastMaxIndex = i
    }
  }

  var target = globalMax
  for i in (0...lastMaxIndex).reversed() {
    target -= array[i]
    if target == 0 {
      return Array(array.prefix(lastMaxIndex + 1).suffix(from: i))
    }
  }

  return []

//  return globalMax
}

let array = [-2,1,-3,4,-1,2,1,-5,4]
print(maxSubArrayValue(array))
print(maxSubArray(array))

//: [Next](@next)
