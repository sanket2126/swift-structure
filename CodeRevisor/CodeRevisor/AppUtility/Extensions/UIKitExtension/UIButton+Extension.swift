//
//  UIButton+Extension.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 31/01/23.
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
