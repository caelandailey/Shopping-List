//
//  main.swift
//  project0
//  CS 4530 - Project 0 - Shopping List
//
//  Program takes in a list of items each on a new line and once complete prints the entire list in alphabetical order
//  Format for input is (item), (item:quantity) or an empty input to end the list
//  Uses a dictionary to store a list of items
//
//  Case sensitive
//
//  Created by Caelan Dailey on 1/15/18.
//  Copyright © 2018 Caelan Dailey. All rights reserved.

// ******************************************** VARIABLES **************************************************

var addingToList = true
let charSeperator:Character = ":"
var dict = [String.SubSequence:Int]()
let error = "Wrong format please try again"
let listInfo = "Please enter your shopping list. The format is (item), (item:quantity) or empty to end the list"

// ******************************************** FUNCTIONS ***************************************************

/*
 * Prompts the user to input the shopping list. Stops when input is empty
 */
func getShoppingList() {
    
    while (addingToList) {
        
        if let input = readLine() {
            if (input.isEmpty) {
                addingToList = false
            } else {   // Input not empty
                
                let seperatedInput = input.split(separator: charSeperator)
                let inputCount = seperatedInput.count
                
                if (inputCount > 2) {    // Check for errors
                    print(error)
                    
                } else {

                    // Get dict count
                    var dictCount = 0
                    if let count = dict[seperatedInput[0]] {
                        dictCount = count
                    }
                    
                    // Add to dict
                    if (inputCount == 2) {
                        let num = seperatedInput[1].filter {$0 != " "}  // Remove white space with number
                        if let val = Int(num)  {
                            dict[seperatedInput[0]] = dictCount + val
                        } else {    // Wrong format
                            print(error)
                        }
                    } else {
                        dict[seperatedInput[0]] = dictCount + 1
                    }
                    
                } // End of inputcount else
            } // End of input not empty
        } // End of readLine
    } // End of while(addingToList)
} // End of func

/*
 * prints instructions for user
 */
func printDescription() {
    print(listInfo, terminator: "\n")
}

/* Prints dictionary thats a shopping list
 * List is comprised of tuples (item, count)
 * Format: "#. ITEM: AMOUNT"
 * Printed alphabetical
 */
func printShoppingList() {
    
    print("Shopping List", terminator: "\n")
    // Sort dict
    let sortedDict = dict.sorted(by: <)
    
    // Loop through dict and print
    var itemCount = 1
    for (item,count) in sortedDict {
        
        print("\(itemCount). \(item): \(count)", terminator: "\n" )
        itemCount += 1
    }
}

// ********************************************* PROGRAM ***********************************************

printDescription()
getShoppingList()
printShoppingList()
