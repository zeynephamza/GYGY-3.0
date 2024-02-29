/* *********************************************
 * @author: Zeynep Ozcan                       *
 * @date :  29.02.2024                         *
 * @instructor: Kerim Caglar                   *
 *                                             *
 * Turkcell GYGY Bootcamp - 3.0                *
 * Homework 4                                  *
 *                                             *
 ***********************************************/


//************** Problem 6 **************//

import Foundation

// Constant global value
let number = 10

func squaredSums(_ n: Int) -> Int {
    var sum = (number * (number + 1) / 2)
    var squaredSums = pow(Decimal(sum), 2)
    var result = NSDecimalNumber(decimal: squaredSums)
    return Int(truncating: result)
    
}

func sumOfSquares(_ n: Int) -> Int {
    return n * (n + 1) * (2 * n + 1) / 6
}

func differance() -> Int {
    return squaredSums(number) - sumOfSquares(number)
}

print(differance())





