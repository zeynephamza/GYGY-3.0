
/* **************************************
 * @author: Zeynep Ozcan                *
 * @date :  25.02.2024                  *
 * @tutor: Kerim Caglar                 *
 *                                      *
 * Turkcell GYGY Bootcamp - 3.0         *
 * Homework 1                           *
 *                                      *
 ****************************************/


//************** Question 1 **************//

print("Question 1\n")

var myStr = "aaba kouq bux"


let number = 3
var myNewStr = ""
let strLength = myStr.count
var charCount = 0
var turnCount: Int = 0

// Checks if the string exist
if strLength > 0 {
    
    for currentCh in myStr {
        
        // Ignoring spaces according to example.
        if currentCh == " " {
            continue
        }
        
        // Finds how many times mychar occures.
        charCount = myStr.filter({ $0 == currentCh}).count
        //print(charCount)
        
        // if occurrence of char in myStr is equal or bigger than number
        if charCount >= number {
            
            //removes the current characters in string
            let removeCharacters: Set<Character> = [currentCh]
            myStr.removeAll(where: { removeCharacters.contains($0) } )
            
            charCount -= 1
        }
        turnCount += 1
    }
    print(myStr) // prints result

    
}else {  // for empty string
    print("")
}
print("--------------------\n")





//*************** Question 2 ***************//

import Foundation

print("Question 2\n")

var myStr2: String = "Merhaba nasilsiniz Merhaba iyiyim siz nasilsiniz ben de iyiyim çok iyiyim"

// Seperating by spaces and creating and assigning an array for words
var myNewArr : [String] = myStr2.components(separatedBy: " ")

var arrayLen = myNewArr.count
var flagg = 1

//Integer array for keeping word count
var myCounterArr : [Int] = Array(repeating: 0, count: arrayLen)


// Finding the occurency of those words
for i in 0 ..< myNewArr.count-1 {
    for j in (i+1) ..< myNewArr.count {
        
        // checks if two words are equal
        if myNewArr[i] == myNewArr[j] {
            
            // Keeps counting for repeating words
            flagg = flagg + 1
            
            //Deleting previously found, repeating word
            myNewArr[j] = ""
        }
        
        
    }
    // Assign the word's count to integer array
    if flagg > 1 {
        myCounterArr[i] = flagg
    }
    // Resets the counter flag
    flagg = 1
    
}


for a in 0 ..< myNewArr.count {
    if myNewArr[a] != "" {
        if myCounterArr[a] == 0 {
            print("\(myNewArr[a]): 1" )
        }else{
            print("\(myNewArr[a]): \(myCounterArr[a])" )
        }
    }
    
}
print("--------------------\n")


//*************** Question 3 ***************//
print("Question 3\n")

// Euler procejct archive questions

// 1- Multiples of 3 or 5
print("Problem 1) ")

var sumOfMultiples = 0

for i in 3 ..< 1000 {
    // Checking i divisible to both 3 and 5
    if i % 3 == 0 || i % 5 == 0 {
        sumOfMultiples += i
        
    }
}
print(sumOfMultiples)


// 2- Even Fibonacci Numbers
print("Problem 2) ")

// Defining 4 million max value as a constant value
let maxValue = 4000000


var i = 1
var temp = 0
var evenTemp = 0
var j = 1
var sumOfEvens = 0
var flag = 0

while sumOfEvens < maxValue {
    // if first value is even
    if i % 2 == 0 {
        evenTemp = i
        
        //if second value also even
        if j % 2 == 0 {
            sumOfEvens = sumOfEvens + i + j
            
        }else {
            // Loops for finding a second even number to add the first even number
            while j % 2 != 0 {
//                evenTemp = i
                temp = i
                i = j
                j = temp + j
                
            }
            // if this is the first turn, adds the first number
            if flag == 0{
                sumOfEvens = sumOfEvens + evenTemp + j
                flag = 1
            
            // Else, keeps adding only the second numbers
            }else{
                // end the loop so we have an even number.
                sumOfEvens += j
            }
        }
        
    }
    temp = i
    i = j
    j = temp + j
}

print(sumOfEvens)
    


// 3) Largest Prime Factor

print("Problem 3) ")

let myNumber = 600851475143

// Chacking the given number is prime or not
func isPrime (num: Int) -> Bool {
    var n = num
    if n <= 1 {
        return false
    }
    var i = 2
    while i <= n/i {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    return true
}

var largestPrime = 0

// Finding the largest prime factor number using isPrime function
for i in 2 ..< myNumber {
    // Checks a number divisible and prime
    if myNumber % i == 0 && isPrime(num: i) {
        largestPrime = i
        print(largestPrime)
    }
}

print("-------------------")
