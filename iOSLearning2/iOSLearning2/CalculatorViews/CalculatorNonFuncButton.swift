//
//  CalculatorOperationButton.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorNonFuncButton: CalculatorButton {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.setTitleColor(.white, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
