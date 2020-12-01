//
//  main.swift
//  SwiftLearning
//
//  Created by wennan.liu on 2020/11/11.
//

import Foundation

var result: Double = 0
let inputErrorMsg = "Invalid input, please input the operator & the number, like: \"+ 3\""

let calculator = Calculator()
print("Swift calculator command line tool")

while(true) {
    print("Current result: \(result)")
    
    if let input = readLine() {
        let tmpArr = input.split(separator: " ")
        if 2 == tmpArr.count {
            let operatorStr = String(tmpArr[0])
            let number2 = Double(tmpArr[1])
            if let number2 = number2 {
                do {
                    result = try calculator.calculate(operatorStr: operatorStr, num1: result, num2: number2)
                } catch let error {
                    if error as? CalculatingError == CalculatingError.invalidOperator {
                        print("CalculatingError: Unsupported operator {\(operatorStr)} received")
                    }
                    else {
                        print("CalculatingError: \(error)")
                    }
                }
            }
            continue
        }
    }
    print(inputErrorMsg)
}
