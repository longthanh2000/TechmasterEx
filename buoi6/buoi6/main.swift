//
//  main.swift
//  buoi6
//
//  Created by Nguyen Thanh Long on 13/07/2023.
//

import Foundation

print("Hello, World!")

// bai 1:
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
         var num = x
        var numbereverse = 0
        while(num>0){
            var lastNum = num % 10
            numbereverse = numbereverse * 10 + lastNum
            num = num/10
        }
        if x == numbereverse{
            return true
        }
        return false
    }
}

// bai 3

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
//class Solution {
//    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
//        let dummyNode = ListNode(0)
//    var current: ListNode? = dummyNode
//    var p1 = list1
//    var p2 = list2
//
//    while let node1 = p1, let node2 = p2 {
//        if node1.val < node2.val {
//            current?.next = node1
//            p1 = node1.next
//        } else {
//            current?.next = node2
//            p2 = node2.next
//        }
//        current = current?.next
//    }
//
//    // Append the remaining nodes from either list1 or list2
//    if let node1 = p1 {
//        current?.next = node1
//    }
//    if let node2 = p2 {
//        current?.next = node2
//    }
//
//    return dummyNode.next
//    }
//}



///////////// bai 2
///
class Solution2 {
    func romanToInt(_ s: String) -> Int {
    let romanValues: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var result = 0
    var previousValue = 0
    
    for char in s {
        if let value = romanValues[char] {
            if value > previousValue {
                result += value - 2 * previousValue
            } else {
                result += value
            }
            previousValue = value
        }
    }
    
    return result
}


}
