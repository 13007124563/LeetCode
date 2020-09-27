//: [Previous](@previous)

import Foundation

// 时间复杂度：O(n) n为字符串的长度
// 空间复杂度：O(m) m为集合中出现过的字符
public class Solution {
    
    func lengthOfLongestSubstring(_ s : String) -> Int {
        
        var maxLength = 0
        var left = 0
        var charIndexMap = [Character : Int]()
        
        // 左边是value, 右边是key
        for (index, char) in s.enumerated() {
            if charIndexMap.keys.contains(char) {
                //注意left 标志当前字符的左边索引
                left = max(left, charIndexMap[char]! + 1)
            }
            
            charIndexMap[char] = index
            
            //这里用index - left + 1 表示当前子串的长度
            maxLength = max(maxLength, index - left + 1)
        }
        
        return maxLength
    }
}

var s1 = "abcabcbb"
var s2 = "bbbbb"
var s3 = "pwwkew"
var s4 = " "
var s5 = "ab"

print(Solution().lengthOfLongestSubstring(s1))
print(Solution().lengthOfLongestSubstring(s2))
print(Solution().lengthOfLongestSubstring(s3))
print(Solution().lengthOfLongestSubstring(s4))
print(Solution().lengthOfLongestSubstring(s5))

//: [Next](@next)
