//: [Previous](@previous)

import Foundation

class Soluction {
    //暴力破解
    //空间复杂度 O(1) 时间复杂度 O(n2)
    func twoSum(nums:[Int], target:Int) -> [Int] {
        for i in 0...(nums.count - 1) {
            for j in i...(nums.count - 1) {
                if target - nums[i] == nums[j] {
                    return [i,j]
                }
            }
        }
        
        return []
    }
    
    //Hash Map 执行两次
    func twoSum2(_ nums:[Int], _ target:Int) -> [Int] {
        var numsDic = [Int:Int]()
        
        for i in 0...(nums.count - 1) {
            numsDic[nums[i]] = i
        }
        
        for i in 0...(nums.count - 1) {
            if numsDic.keys.contains(target - nums[i]) && numsDic[target - nums[i]] != i {
                if let otherIndex = numsDic[target - nums[i]] {
                    return [i,otherIndex]
                }
            }
        }
        
        return []
    }
    
    //Hash Map执行一次
    func twoSum3(_ nums:[Int],_ target:Int) -> [Int] {
        var numsDic = [Int:Int]()
        
        for i in 0...(nums.count - 1) {
            numsDic[nums[i]] = i
            
            if numsDic.keys.contains(target - nums[i]) && numsDic[target - nums[i]] != i {
                if let otherIndex = numsDic[target - nums[i]] {
                    return [otherIndex,i]
                }
            }
        }
        
        return []
        
    }
    
}

let nums = [2,7,11,15,8,24]
let target = 13

let solution = Soluction()

print(solution.twoSum(nums: nums, target: target))
print(solution.twoSum2(nums, target))
print(solution.twoSum3(nums, target))



//: [Next](@next)
