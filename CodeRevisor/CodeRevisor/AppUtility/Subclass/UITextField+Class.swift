//
//  UITextField+Class.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

class ThemeTextField: UITextField {
    
    @IBInspectable var leftPadding : CGFloat = 12
    @IBInspectable var rightPadding : CGFloat = 12
    
    private var padding: UIEdgeInsets = UIEdgeInsets()
    
    @IBInspectable var pauseDelay : Double = 0.2
    var timer: Timer?
    var actionAfterDelayClosure : (()->Void)?
    
    func initialize() {
//        if Bundle.main.isArabicLanguage {
//            padding = UIEdgeInsets(top: 0, left: rightPadding, bottom: 0, right: leftPadding)
//        } else {
            padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: rightPadding)
//        }
        
        self.font(name: .medium,size: 15)
            .backGroundColor(color: .primaryText)
            .textColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
        
        self.placeHolderColor = UIColor.gray
//        self.superview?.shadow()
        
        //For Typing Delay
        self.addTarget(self, action: #selector(changedTextFieldValue), for: .editingChanged)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initialize()
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.width - 30, y: 0, width: 20 , height: bounds.height)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: 20 , height: bounds.height)
    }
}

extension ThemeTextField {
    @objc func changedTextFieldValue(){
        timer?.invalidate()
        //setup timer
        timer = Timer.scheduledTimer(timeInterval: pauseDelay,
                                     target: self,
                                     selector: #selector(self.executeAction),
                                     userInfo: nil,
                                     repeats: false)
    }

    @objc func executeAction() {
        actionAfterDelayClosure?()
    }
}

//dont select action in textfield
class RestrictionTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initialize()
    }
    
    func initialize() {
        super.awakeFromNib()
        self.autocorrectionType = .no
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    
    override func closestPosition(to point: CGPoint) -> UITextPosition? {
        let beginning = self.beginningOfDocument
        let end = self.position(from: beginning, offset: self.text?.count ?? 0)
        return end
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.copy(_:)) || action == #selector(UIResponderStandardEditActions.select(_:)) || action == #selector(UIResponderStandardEditActions.cut(_:)) || action == #selector(UIResponderStandardEditActions.paste(_:)) || action == #selector(UIResponderStandardEditActions.selectAll(_:)){
            return false
        }
        else {
            return super.canPerformAction(action, withSender: sender)
        }
    }
}
