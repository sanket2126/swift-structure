//
//  UILabel+Class.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

class TitleLabel: UILabel {
    
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
    
    // FOR STORYBOARD USER
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        initialize()
//    }
    
    func initialize() {
        self.applyTheme(themeStyle: .title)
        numberOfLines = 2
        textAlignment = .left
    }
}

class DescLabel: UILabel {
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
        
        self.applyTheme(themeStyle: .descriptionLabel)
        numberOfLines = 0
        textAlignment = .left
    }
}

class CenterLabel: UILabel {
    
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
        self.applyTheme(themeStyle: .centerLabel)
        numberOfLines = 0
        textAlignment = .center
    }
}

class PaddingLabel: UILabel {

    var padding: UIEdgeInsets = UIEdgeInsets()

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + padding.left + padding.right,
                      height: size.height + padding.top + padding.bottom)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (padding.left + padding.right)
        }
    }
}
