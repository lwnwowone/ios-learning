//
//  CalculatorEvent.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import Foundation

enum CalculatorEvent {

    case undefined
    case operatorSelected(_ operatorStr: String)
    case functionButtionClicked(_ funcStr: String)
    case valueButtonClicked(_ valueStr: String)
    case calculeButtonClicked
    
}
