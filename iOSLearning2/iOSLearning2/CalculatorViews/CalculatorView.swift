//
//  CalculatorView.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

protocol CalculatorViewProtocol {
    
    var buttonClicked: ((CalculatorEvent) -> Void)? { get set }
    
    func setOperator(operatorValue: String)
    func clearOperator()
    func addText(str: String) -> Bool
    func clearText()
    func setResult(result: Double)
    
    func getCurrentInputValue() -> Double?
}

class CalculatorView: UIView, CalculatorViewProtocol {
    
    var buttonClicked: ((CalculatorEvent) -> Void)?
    
    func setOperator(operatorValue: String) {
        resultView.operatorValue = operatorValue
    }
    
    func clearOperator() {
        resultView.operatorValue = ""
    }
    
    func addText(str: String) -> Bool {
        return resultView.addText(str: str)
    }
    
    func setResult(result: Double) {
        resultView.setResult(dValue: result)
    }
    
    func getCurrentInputValue() -> Double? {
        return resultView.doubleValue
    }
    
    func clearText() {
        resultView.clearText()
    }
    
    let resultView = CalculatorResultView()
    let buttons = [
        CalculatorFunctionButton("AC"),
        CalculatorPlaceHolderButton(),
        CalculatorPlaceHolderButton(),
        CalculatorOperatorButton("/"),
        
        CalculatorValueButton("7"),
        CalculatorValueButton("8"),
        CalculatorValueButton("9"),
        CalculatorOperatorButton("x"),
        
        CalculatorValueButton("4"),
        CalculatorValueButton("5"),
        CalculatorValueButton("6"),
        CalculatorOperatorButton("-"),
        
        CalculatorValueButton("1"),
        CalculatorValueButton("2"),
        CalculatorValueButton("3"),
        CalculatorOperatorButton("+"),
        
        CalculatorValueButton("0"),
        CalculatorPlaceHolderButton(),
        CalculatorValueButton("."),
        CalculatorCalculateButton()
    ]

    init() {
        super.init(frame: .zero)
        backgroundColor = .black
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        addSubview(resultView)
        
        for button in buttons {
            button.buttonClicked = { [weak self] (event) in
                self?.buttonClicked?(event)
            }
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let padding: CGFloat = 20
        let insidePadding: CGFloat = 10

        let resultViewLength = UIScreen.main.bounds.width - 2 * padding
        let buttonLength = (resultViewLength - 3 * insidePadding) / 4

        resultView.frame = CGRect(x: padding, y: padding + 20, width: resultViewLength, height: 200)

        let btnStartLocX: CGFloat = resultView.frame.minX
        let btnStartLocY: CGFloat = resultView.frame.maxY + insidePadding

        for index in 0...buttons.count - 1 {
            let button = buttons[index]
            button.frame = CGRect(x: btnStartLocX + CGFloat(index % 4) * (buttonLength + insidePadding),
                                  y: btnStartLocY + CGFloat(index / 4) * (buttonLength + insidePadding),
                                  width: buttonLength,
                                  height: buttonLength)
        }
    }
    
}
