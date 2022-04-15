import UIKit

class Solution {

    var cache: [Int: Int] = [:]

    func rob(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        else {
            return max(robRecursive(0, nums), robRecursive(1, nums))
        }
    }

    func robRecursive(_ index: Int, _ nums: [Int]) -> Int {
        if let v = cache[index] {
            return v
        }
        else if index >= nums.count {
            return 0
        }
        else if index == nums.count - 3 {
            let v = nums[index] + nums[index + 2]
            cache[index] = v
            return v
        }
        else if index == nums.count - 4 {
            let v = nums[index] + max(nums[index + 2], nums[index + 3])
            cache[index] = v
            return v
        }
        else {
            let v = nums[index] + max(robRecursive(index + 2, nums),
                                      robRecursive(index + 3, nums))
            cache[index] = v
            return v
        }
    }

}
