//
//  UIButton+Class.swift
//  MVVMBasicStructure
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

extension UIButton {
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        //Vibration.light.vibrate()
    }
    override open var intrinsicContentSize: CGSize {
        
        let intrinsicContentSize = super.intrinsicContentSize
        
        let adjustedWidth = intrinsicContentSize.width + titleEdgeInsets.left + titleEdgeInsets.right
        let adjustedHeight = intrinsicContentSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom
        
        return CGSize(width: adjustedWidth, height: adjustedHeight)
        
    }
    
//    open override func awakeFromNib() {
//        super.awakeFromNib()
//        // self.semanticContentAttribute = Bundle.main.isArabicLanguage ? .forceRightToLeft : .forceLeftToRight
//        self.frame.size = self.intrinsicContentSize
//        if #available(iOS 10.0, *) {
//            self.titleLabel?.adjustsFontForContentSizeCategory = true
//        }
//        self.titleLabel?.lineBreakMode = .byTruncatingTail
//        if let text = self.title(for: self.state) {
//            self.setTitle(text.localized, for: self.state)
//        }
//    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        let factor: CGFloat =  1
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount*factor, bottom: 0, right: insetAmount*factor)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount*factor, bottom: 0, right: -insetAmount*factor)
        self.contentEdgeInsets = UIEdgeInsets(top: self.contentEdgeInsets.top, left: insetAmount, bottom: self.contentEdgeInsets.bottom, right: insetAmount)
    }
    
    func imageUnderText(padding: CGFloat = 8.0) {
        if let image = self.imageView?.image {
            let imageSize: CGSize = image.size
            self.titleEdgeInsets = UIEdgeInsets(top: padding, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
            let labelString = NSString(string: self.titleLabel!.text!)
            let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font as Any])
            self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + padding), left: 0.0, bottom: 0.0, right: -titleSize.width)
        }
    }
    
    func changeImageTint(tint: UIColor = .red) {
        if let img = self.imageView?.image {
            let editableImage = img.withRenderingMode(.alwaysTemplate)
            self.setImage(editableImage, for: .normal)
            self.tintColor = tint
        }
    }
}

//Theme Color button
class ThemeButton: UIButton {
    // FOR DESIGN VIA CODE
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    // FOR DESIGN VIA CODE
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    func initialize() {
        
        self.font(name: .bold, size: 15).textColor(color: .primaryBackground).backGroundColor(color: .primaryText)
        if let _ = self.imageView?.image {
            self.centerTextAndImage(spacing: 12)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.cornerRadius(cornerRadius: self.bounds.height / 2)
    }
    
    func setAbility(enable: Bool) {
        self.isEnabled = enable
        if enable {
            self.backGroundColor(color: .primaryText)
        } else {
            self.backGroundColor(color: .gray)
        }
    }
}

class GreenButton: UIButton {
    // FOR DESIGN VIA CODE
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    // FOR DESIGN VIA CODE
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    func initialize() {
        
        self.font(name: .bold, size: 14).textColor(color: .green).backGroundColor(color: .clear)
        if let _ = self.imageView?.image {
            self.centerTextAndImage(spacing: 12)
        }
    }
}

class RedButton: UIButton {
    // FOR DESIGN VIA CODE
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    // FOR DESIGN VIA CODE
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    func initialize() {
        
        self.font(name: .bold, size: 14).textColor(color: .red).backGroundColor(color: .clear)
        if let _ = self.imageView?.image {
            self.centerTextAndImage(spacing: 12)
        }
    }
}

//Flip image button
//class FlipImageButton: UIButton {
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        if Bundle.main.isArabicLanguage {
//            self.setImage(self.currentImage?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
//        }
//    }
//}

//Right side icon button
class ButtonIconRight: UIButton {
    // FOR DESIGN VIA CODE
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    // FOR DESIGN VIA CODE
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func initialize() {
        self.semanticContentAttribute = .forceLeftToRight
        self.font(name: .medium, size: 13).textColor(color: .primaryText).backGroundColor(color: .clear)
    }
    
    override func imageRect(forContentRect contentRect:CGRect) -> CGRect {
        var imageFrame = super.imageRect(forContentRect: contentRect)
        imageFrame.origin.x = super.titleRect(forContentRect: contentRect).maxX - imageFrame.width
        return imageFrame
    }

    override func titleRect(forContentRect contentRect:CGRect) -> CGRect {
        var titleFrame = super.titleRect(forContentRect: contentRect)
        if (self.currentImage != nil) {
            titleFrame.origin.x = super.imageRect(forContentRect: contentRect).minX
        }
        return titleFrame
    }
}
