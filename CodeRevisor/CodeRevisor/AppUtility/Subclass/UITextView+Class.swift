//
//  UITextView+Class.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 02/03/23.
//

import UIKit

class ThemeTextView: UITextView {
    
    override init(frame: CGRect,textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
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
    
    convenience init(_placeHolder: String?) {
        self.init(frame: .zero)
//        placeholder = _placeHolder
//        placeHolderColor = .primaryBackground.withAlphaComponent(0.7)
    }
    
    private func initialize() {
        self.isEditable = true
        self.isSelectable = true
        
//        self.dataDetectorTypes = .link
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = true
        self.contentInsetAdjustmentBehavior = .automatic
        self.textContainerInset = UIEdgeInsets(top: 10.0, left: 10, bottom: 4.0, right: 10)
        
        self.font(name: .medium,size: 15)
            .backGroundColor(color: .primaryText)
            .textColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
    }
    
    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.isKind(of: UILongPressGestureRecognizer.self) {
            gestureRecognizer.isEnabled = false
        }
        super.addGestureRecognizer(gestureRecognizer)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(copy(_:)) || action == #selector(paste(_:)) || action == #selector(cut(_:))
            || action == #selector(select(_:)) || action == #selector(selectAll(_:)){
            return true
        } // Pending issue while select and select all
        return false
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
    
//    override func caretRect(for position: UITextPosition) -> CGRect {
//        self.bounds
//    }
}


class DataDetectionTextView: UITextView {
    
    override init(frame: CGRect,textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
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
    
    convenience init(_placeHolder: String?) {
        self.init(frame: .infinite)
//        placeholder = _placeHolder
//        placeHolderColor = .primaryBackground.withAlphaComponent(0.7)
    }
    
    private func initialize() {
        self.isEditable = false
        self.isSelectable = true
        
        self.dataDetectorTypes = .link
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = false
        self.delegate = self
        self.contentInsetAdjustmentBehavior = .never
        self.textContainerInset = UIEdgeInsets(top: 0.0, left: 14, bottom: 0.0, right: 14)
        
        self.font(name: .medium,size: 15)
            .backGroundColor(color: .primaryText)
            .textColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
    }
    
    override func addGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer) {
        if gestureRecognizer.isKind(of: UILongPressGestureRecognizer.self) {
            gestureRecognizer.isEnabled = false
        }
        super.addGestureRecognizer(gestureRecognizer)
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
    override func selectionRects(for range: UITextRange) -> [UITextSelectionRect] {
        return []
    }
//    override func caretRect(for position: UITextPosition) -> CGRect {
//        return .zero
//    }
}

extension DataDetectionTextView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(URL)
        return true
    }
}
