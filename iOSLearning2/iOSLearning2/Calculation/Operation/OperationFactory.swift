//
//  OperationFactory.swift
//  SwiftLearning
//
//  Created by wennan.liu on 2020/11/18.
//

import Foundation

class OperationFactory {
    
    static let shared: OperationFactory = OperationFactory()
    
    func getOperation(operatorStr: String) -> OperationProtocol? {
        switch operatorStr {
        case "+":
            return AddOperation()
        case "-":
            return SubOperation()
        case "x":
            return MulOperation()
        case "/":
            return DevOperation()
        default:
            return nil
        }
    }
    
}
