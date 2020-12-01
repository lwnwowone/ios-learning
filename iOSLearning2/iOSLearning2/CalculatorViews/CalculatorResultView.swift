//
//  CalculatorResultView.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorResultView: UIView {
    
    fileprivate let resultLabel = UILabel()
    
    fileprivate var displayValue: String = "" {
        didSet {
            resultLabel.text = displayValue
        }
    }
    
    var doubleValue: Double? {
        get {
            return Double(displayValue)
        }
    }
    
    fileprivate let operatorLabel = UILabel()

    var operatorValue: String? {
        get {
            return operatorLabel.text
        }
        set {
            operatorLabel.text = newValue
        }
    }
    
    fileprivate var hasDot = false

    init() {
        super.init(frame: .zero)

        resultLabel.textColor = .white
        resultLabel.font = UIFont.systemFont(ofSize: 60)
        resultLabel.textAlignment = .right
        resultLabel.adjustsFontSizeToFitWidth = true
        addSubview(resultLabel)
        
        operatorLabel.textColor = .white
        operatorLabel.font = UIFont.systemFont(ofSize: 60)
        operatorLabel.textAlignment = .right
        addSubview(operatorLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addText(str: String) -> Bool {
        if "." == str {
            if hasDot {
                return false
            }
            hasDot = true
        }
        displayValue += str
        return true
    }
    
    func clearText() {
        hasDot = false
        displayValue = ""
    }
    
    func setResult(dValue: Double) {
        hasDot = false
        let tValue = String(dValue)
        let tArray = tValue.split(separator: ".")
        if 2 == tArray.count && String(tArray[1]) == "0" {
            displayValue = String(tArray[0])
        }
        else {
            displayValue = tValue
        }
    }
    
    override func layoutSubviews() {
        let padding: CGFloat = 10
        let height: CGFloat = 80
        resultLabel.frame = CGRect(x: padding,
                             y: bounds.size.height - height - padding,
                             width: bounds.size.width - 2 * padding,
                             height: height)
        
        operatorLabel.frame = CGRect(x: padding,
                                     y: resultLabel.frame.minY - height - padding,
                                     width: bounds.size.width - 2 * padding,
                                     height: height)
    }
    
}
