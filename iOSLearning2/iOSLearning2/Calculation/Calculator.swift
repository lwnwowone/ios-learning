//
//  Calculator.swift
//  SwiftLearning
//
//  Created by wennan.liu on 2020/11/18.
//

import Foundation

enum CalculatingError: Error {
    case invalidOperator
}

class Calculator {
    
    func calculate(operatorStr: String, num1: Double, num2: Double) throws -> Double {
        if let operation = OperationFactory.shared.getOperation(operatorStr: operatorStr) {
            return operation.calculate(num1: num1, num2: num2)
        }
        else {
            throw CalculatingError.invalidOperator
        }
    }
    
}
