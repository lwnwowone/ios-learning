//
//  CalculatorCalculateButton.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorCalculateButton: CalculatorOperatorButton {

    init() {
        super.init("=")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func buttonEvent(_ btnTitle: String) -> CalculatorEvent {
        return CalculatorEvent.calculeButtonClicked
    }

}
