/* *********************************************
 * @author: Zeynep Ozcan                       *
 * @date :  28.02.2024                         *
 * @instructor: Kerim Caglar                   *
 *                                             *
 * Turkcell GYGY Bootcamp - 3.0                *
 * Homework 3                                  *
 * Euler Project Problems 4 and 5 Solutions    *
 *                                             *
 ***********************************************/


//************** Problem 4 **************//

print("Problem 4) Largest Palindrome Product")

import Foundation

let maxProduct = 999
let minProduct = 99

var firstMultiplier = maxProduct
var secMultiplier   = maxProduct
var tmpFirst = 0
var tmpSec   = 0

var resultProduct = 0
var flagBreak = 0

var maxResult = 0

func isPalindrome(_ number: Int) -> Bool {
    
    var reverse = 0
    var rem = 0
    var n = number
    
    while n != 0 {
        // Finding the last digit
        rem = n % 10
        
        // Add the last digit to top for reversing
        reverse = reverse * 10 + rem
        
        // Pass the last digit
        n /= 10
    }
    
    // If the number is equal to it's reverse
    if number == reverse {
        return true
    } else {
        return false
    }

}

for firstMultiplier in stride(from: maxProduct, to: minProduct, by: -1) {
    
    for secMultiplier in stride(from: maxProduct, to: firstMultiplier, by: -1) {
        
        resultProduct = firstMultiplier * secMultiplier
        
        // Comparing if the reversed integer is same or not with before-self.
        if  isPalindrome(resultProduct) {
            
            // If there is bigger product
            if resultProduct > maxResult {
                
                // Store the multipliers to compare
                tmpFirst = firstMultiplier
                tmpSec   = secMultiplier
                
                maxResult = resultProduct
            }
            if tmpFirst > firstMultiplier && tmpSec > secMultiplier {
                flagBreak = 1
            }
        }
    }
    if flagBreak == 1 {
        break
    }
}

print(maxResult)


//************** Problem 5 **************//

print("Problem 5 - Smallest Multiple")

// Definitions
var from = 11
var to   = 20

var myArray = Array(from...to)
var i = 2
var flag = 0
var lcdResult = 1

while i < to {
    for element in myArray {
        if element % i == 0 {
            
            // Finding the index of element and change it's value with the division by i.
            if let elementIndex = myArray.firstIndex(of: element) {
                myArray[elementIndex] = element / i
            }
            
            // If any number is divisible, we will not increase i.
            flag = 1
        }
    }
    
    // If there is no divisor, couninue by increasing i by 1.
    if flag == 0 {
        i += 1
    } else {
        
        // Multiply the common divisor and add to result.
        lcdResult *= i

        //If flag == 1 , makes flag false and continue without increasing i.
        flag = 0
    }
}

// If the result is not even makes it even.
if lcdResult % 2 == 1 {
    lcdResult *= 2
}

print(lcdResult)





