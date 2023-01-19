//
//  GExtension+UIFont.swift
//  MVVMBasicStructure
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum FontType: String {
        case light                   = "Verdana Light"
        case regular                 = "Verdana"
        case medium                  = "Verdana Medium"
        case semibold                = "Verdana SemiBold"
        case bold                    = "Verdana Bold"
    }
    
    /// Set custom font
    /// - Parameters:
    ///   - type: Font type.
    ///   - size: Size of font.
    ///   - isRatio: Whether set font size ratio or not. Default true.
    /// - Returns: Return font.
    class func customFont(ofType type: FontType, withSize size: CGFloat, enableAspectRatio isRatio: Bool = true) -> UIFont {
        return UIFont(name: type.rawValue, size: isRatio ? size * ScreenSize.fontAspectRatio : size) ?? UIFont.systemFont(ofSize: size)
    }
}

