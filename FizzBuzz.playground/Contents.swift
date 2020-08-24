import UIKit
import Foundation

extension Int
{
    func fizzBuzz(divisors: [Int], texts: [String])->String
    {
        var str = ""
        
        for (idx, d) in divisors.enumerated()
        {
            if ((self % d) == 0)
            {
                str = str + texts[idx]
            }
        }
        
        if (str.isEmpty)
        {
            str = String("\(self)")
        }
        
        return str
    }
}

extension Array where Element == Int
{
    func fizzBuzz(divisors: [Int], texts: [String])->String
    {
        if (divisors.count != texts.count)
        {
            return "Invalid Input"
        }
        
        if (divisors.count == 0)
        {
            return "Invalid Input"
        }
        
        let str = self.reduce("") { (s, elem) -> String in
            return s + "\r\n" + elem.fizzBuzz(divisors: divisors, texts: texts)
        }
        
        return str
    }
}

let output = Array(1...100).fizzBuzz(divisors: [3,5], texts: ["Fizz", "Buzz"])
print(output)
