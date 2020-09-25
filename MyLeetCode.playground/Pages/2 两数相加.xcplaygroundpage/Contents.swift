//: [Previous](@previous)

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(val: Int,next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
    
    convenience init(_ array:[Int]) {
        self.init(array[0])
        
        var cur = self
        
        for i in 1...(array.count - 1) {
            cur.next = ListNode(array[i])
            
            cur = cur.next as! Self
            
            if i == array.count - 1 {
                cur.next = nil
            }
        }
    }
}

extension ListNode : CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(val)"
        }
        
        return "\(val) ->" + String(describing: next)
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        //valid case
        if l1 == nil || l2 == nil  {
            return nil
        }
        
        //哑结点
        let dummy = ListNode.init(0)
        var head = dummy
        var p = l1
        var q = l2
        
        var addOne : Int = 0
        
        while p != nil || q != nil || addOne != 0 {
            let var1 = p?.val ?? 0;
            let var2 = q?.val ?? 0;
            let sum = var1 + var2 + addOne;
            
            head.next = ListNode(sum % 10)
            addOne = sum / 10;
            
            head = head.next!
            
            p = p?.next
            q = q?.next
        }
        
        
        return dummy.next
    }
}

var l1 = ListNode([2,4,3])
var l2 = ListNode([5,6,4])

let solution = Solution()

var result = solution.addTwoNumbers(l1, l2)

print(result)


//: [Next](@next)
