//
//  CalculatorOperatorButton.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorOperatorButton: CalculatorNonFuncButton {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.backgroundColor = UIColor(red: 254/255.0, green: 149/255.0, blue: 38/255.0, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buttonEvent(_ btnTitle: String) -> CalculatorEvent {
        return CalculatorEvent.operatorSelected(btnTitle)
    }
    
}
