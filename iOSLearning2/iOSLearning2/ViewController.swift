//
//  ViewController.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

enum CalculatorState {
    case clear
    case operatorSet
    case baseOnResult
}

class ViewController: UIViewController {
    
    var result: Double?
    var operation: OperationProtocol?
    var state: CalculatorState = .clear
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func loadView() {
        view = CalculatorView()
    }
    
    override func viewDidLoad() {
        var calculatorView = view as! CalculatorViewProtocol
        
        calculatorView.buttonClicked = { [weak self] (event) in
            guard  let self = self else {
                return
            }
            
            print("buttonClicked: \(event)")
            switch event {
            case .operatorSelected(let operatorStr):
                if self.state == .clear || self.state == .baseOnResult {
                    if let tOperation = OperationFactory.shared.getOperation(operatorStr: operatorStr) {
                        self.operation = tOperation
                        calculatorView.setOperator(operatorValue: operatorStr)
                        self.result = calculatorView.getCurrentInputValue()
                        calculatorView.clearText()
                        self.state = .operatorSet
                    }
                    else {
                        print("operatorStr not supported!")
                    }
                }
                else {
                    print("Invalid state!")
                }
            case .valueButtonClicked(let valueStr):
                if self.state == .clear || self.state == .operatorSet {
                    if !calculatorView.addText(str: valueStr) {
                        print("Invalid input!")
                    }
                }
                else {
                    print("Invalid state!")
                }
            case .calculeButtonClicked:
                if self.state == .operatorSet {
                    if let dValue = calculatorView.getCurrentInputValue() {
                        calculatorView.clearText()
                        let oResult = self.operation!.calculate(num1: self.result!, num2: dValue)
                        calculatorView.setResult(result: oResult)
                        self.state = .baseOnResult
                    }
                    else {
                        print("Cannot get 2nd number from input!")
                    }
                }
                else {
                    print("Invalid state!")
                }
            case .functionButtionClicked(let funcStr):
                switch funcStr {
                case "AC":
                    self.result = nil
                    calculatorView.clearText()
                    calculatorView.clearOperator()
                    self.state = .clear
                default:
                    print("Non supported functional received!")
                }
            default:
                break
            }
        }
    }
    
}

