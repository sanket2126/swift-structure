//
//  UIButton+Class.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

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
        
        self.applyTheme(themeStyle: .themeButton)
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
        
        self.applyTheme(themeStyle: .greenButton)
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
        
        self.applyTheme(themeStyle: .redButton)
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
