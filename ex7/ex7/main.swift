//
//  main.swift
//  ex7
//
//  Created by Nguyen Thanh Long on 15/07/2023.
//

import Foundation

print("Hello, World!")

//print("Hello, World!")
//var arr = ["flower","flow","flight"]
// câu 1
func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else {
        return ""
    }
    // find the shortest string in array
    let shortestString = strs.min(by: { $0.count < $1.count })!

    for index in shortestString.indices{
        let char = shortestString[index]

        for i in strs{
            if index >= i.endIndex || char != i[index]{
                return String(shortestString[..<index])
            }
        }
    }
    return shortestString
}
//

// cau 2
func lengthOfLastWord(_ s: String) -> Int {
    var str = s.trimmingCharacters(in: .whitespaces)
    let arr = s.components(separatedBy: " ")
    return arr[arr.count - 1].count
}
print(lengthOfLastWord("Hello word"))


// câu 3

func plusOne(_ digits: [Int]) -> [Int] {
     var str = ""
   for i in digits {
       str.append(String(i))
   }
   var nextNumber = Int(str)! + 1
   return Array(String(nextNumber).compactMap{ Int(String($0)) })
   }
