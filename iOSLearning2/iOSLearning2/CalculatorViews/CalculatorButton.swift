//
//  CalculatorButtons.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorButton: UIButton {
    
    var buttonClicked: ((CalculatorEvent) -> Void)?
    
    override var frame: CGRect {
        didSet {
            layer.cornerRadius = frame.height / 2
        }
    }
    
    fileprivate var btnTitle: String!
    
    init(_ title: String?) {
        super.init(frame: .zero)
        
        if let title = title {
            btnTitle = title
            self.setTitle(title, for: .normal)
            self.setTitleColor(.gray, for: .highlighted)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            self.addTarget(self, action: #selector(buttonClickedAction), for: .touchUpInside)
        }
        else {
            self.backgroundColor = .clear
            btnTitle = ""
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClickedAction() {
        let event = buttonEvent(btnTitle)
        if case .undefined = event {
            // ignore event
        }
        else {
            buttonClicked?(event)
        }
    }
    
    func buttonEvent(_ btnTitle: String) -> CalculatorEvent {
        return .undefined
    }
    
}
