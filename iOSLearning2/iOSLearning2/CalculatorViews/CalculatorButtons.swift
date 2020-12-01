//
//  CalculatorButtons.swift
//  iOSLearning2
//
//  Created by wennan.liu on 2020/11/18.
//

import UIKit

class CalculatorButton: UIButton {
    
    var buttonClicked: ((String) -> Void)?
    
    override var frame: CGRect {
        didSet {
            layer.cornerRadius = frame.height / 2
        }
    }
    
    init(_ title: String?) {
        super.init(frame: .zero)
        
        if let title = title {
            self.setTitle(title, for: .normal)
            self.setTitleColor(.gray, for: .highlighted)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
        else {
            self.backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CalculatorPlaceHolderButton: CalculatorButton {
    
    init() {
        super.init(nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CalculatorFunctionButtons: CalculatorButton {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = UIColor(white: 155/255.0, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CalculatorOperationButtons: CalculatorButton {
    
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

class CalculatorOperatorButtons: CalculatorOperationButtons {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.backgroundColor = UIColor(white: 45/255.0, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CalculatorNumberButtons: CalculatorButton {
    
    override init(_ title: String?) {
        super.init(title)
        if let _ = title {
            self.backgroundColor = UIColor(red: 254/255.0, green: 149/255.0, blue: 38/255.0, alpha: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

