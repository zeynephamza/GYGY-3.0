/* **************************************
 * @author: Zeynep Ozcan                *
 * @date :  01.03.2024                  *
 * @instructor: Kerim Caglar            *
 *                                      *
 * Turkcell GYGY Bootcamp - 3.0         *
 * Homework 5                           *
 *                                      *
 ****************************************/


//************** Question 1 **************//
print("Q1) ", terminator: "")

func addPlusMinus() {
    // Definitions as constant value
    let number = 5
    
    
    for i in 0..<number {
        // Prints + for even numbers and - for odds.
        if i % 2 == 0 {
            print("+", terminator: "")
        } else {
            print("-", terminator: "")
        }
    }
    print("") // println
}

addPlusMinus()

//************** Question 2 **************//
print("Q2) ", terminator: "")
func addFive(){
    
    // Definitions as constant value
    let givenNumber = 920
    let five = 5
    
    // Converting numbers to string
    var strNum  = String(givenNumber)
    var strFive = String(five)
    
    
    var flag = false
    var counter = 0
    var newStr = ""
    
    // Loop for the characters of given number
    for i in strNum  {
        
        // Checks if the number grater than 5. If so, append '5' to new string array.
        if i < Character (strFive) && flag == false {
            newStr.append(strFive)
            flag = true
            //print(i)
        }
        // Keep adding other elements
        newStr.append(i)
        counter += 1
        
    }
    print(newStr)
}

addFive()
