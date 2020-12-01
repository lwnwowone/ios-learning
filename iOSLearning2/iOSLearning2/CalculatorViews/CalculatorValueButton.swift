//
//  CalculatorNumberButton.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorValueButton: CalculatorButton {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.backgroundColor = UIColor(white: 45/255.0, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buttonEvent(_ btnTitle: String) -> CalculatorEvent {
        return CalculatorEvent.valueButtonClicked(btnTitle)
    }
    
}
