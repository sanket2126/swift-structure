//
//  UITextField+Extension.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit
//import SkyFloatingLabelTextField

var kRegex = "kRegex"
var kdefaultCharacter = "kdefaultCharacter"
var kPatternCharacter = "kPatternCharacter"
var kMaxLength  =   "kMaxLength"

extension UITextField: UITextFieldDelegate {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        if #available(iOS 10.0, *) {
            self.adjustsFontForContentSizeCategory = true
        }
    }
    
    var maxLength : Int? {
        set {
            self.delegate = self
            objc_setAssociatedObject(self, &kMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &kMaxLength) as? Int
        }
    }
    
    var regex : String? {
        set {
            self.delegate = self
            objc_setAssociatedObject(self, &kRegex, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &kRegex) as? String
        }
    }
    
    var defaultcharacterSet : CharacterSet? {
        set {
            self.delegate = self
            objc_setAssociatedObject(self, &kdefaultCharacter, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
        get {
            return objc_getAssociatedObject(self, &kdefaultCharacter) as? CharacterSet
        }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UITextField {
    
    class func connectFields(fields:[UITextField]) -> Void {
        guard let last = fields.last else {
            return
        }
        for i in 0 ..< fields.count - 1 {
//            print("field text -",fields[i].text)
            fields[i].returnKeyType = .next
            fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
    }
    
    var trimmedText: String? {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var cleanTrimmedText: String {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }
    
    var isEmpty: Bool {
        return text?.isEmpty == true
    }
    
    func clear() {
        text = ""
        attributedText = NSAttributedString(string: "")
    }
    
    func setLeftImage(img: UIImage?) {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = img
        imgView.contentMode = .scaleAspectFit//center
        leftView = imgView
        leftViewMode = .always
    }
    
    func setRightImage(img: UIImage?, contentMode: ContentMode = .right) {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = img
        imgView.contentMode = contentMode
        rightView = imgView
        rightViewMode = .always
    }
    
    func setRightView(view: UIView) {
//        imgView.image = img
//        imgView.contentMode = contentMode
        rightView = view
        rightViewMode = .always
    }

    func setBottomBorder(borderColor: UIColor) {
        
        self.borderStyle = UITextField.BorderStyle.none
        self.backgroundColor = UIColor.clear
        let width = 1.0
        
        let borderLine = UIView()
        borderLine.frame = CGRect(x: 0, y: Double(self.frame.height) - width, width: Double(self.frame.width), height: width)
        
        borderLine.backgroundColor = borderColor
        self.addSubview(borderLine)
    }
}
