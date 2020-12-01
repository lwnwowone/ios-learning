//
//  DevOperation.swift
//  SwiftLearning
//
//  Created by wennan.liu on 2020/11/18.
//

import Foundation

class DevOperation: OperationProtocol {
    
    func calculate(num1: Double, num2: Double) -> Double {
        if 0 == num2 {
            print("DevOperation: num2 cannot be 0, will retrun 0 as result.")
            return 0
        }
        return num1 / num2
    }
    
}
