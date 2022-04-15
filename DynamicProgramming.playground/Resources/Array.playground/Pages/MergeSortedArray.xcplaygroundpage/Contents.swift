//: [Previous](@previous)

import Foundation

func mergeSortedArray<T: Comparable>(_ arr1: [T], _ arr2: [T]) -> [T] {
  // if one is empty, return the other
  // if both are not empty
  // 2 index pointer in front of each array
  // compare those 2 values, pick the smaller one
  // move to next
  // end when we run out of items on both arrays

  if arr1.count == 0 {
    return arr2
  }
  if arr2.count == 0 {
    return arr1
  }

  var result: [T] = []
  var index1 = 0
  var index2 = 0

  while index1 < arr1.count || index2 < arr2.count {
    if arr1[index1] < arr2[index2] {
      result.append(arr1[index1])
      index1 += 1
      if index1 == arr1.count {
        result.append(contentsOf: arr2.suffix(from: index2))
        break
      }
    }
    else {
      result.append(arr2[index2])
      index2 += 1
      if index2 == arr2.count {
        result.append(contentsOf: arr1.suffix(from: index1))
        break
      }
    }
  }
  return result
}

mergeSortedArray([1, 3, 5, 9], [2])

//: [Next](@next)
