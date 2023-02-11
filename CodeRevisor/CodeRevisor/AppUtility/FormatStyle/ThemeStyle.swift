//
//  ThemeStyle.swift
//  FormatStyle
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

// Add paramters based on your requirement
struct ThemeStyle {
    var textColor : UIColor?
    var backGroundColor: UIColor?
    var fontName : UIFont.FontType?
    var fontSize : CGFloat?
}

// Make your own theme
// Create theme only if your application has global theme
enum Theme {
    case title
    case centerLabel
    case descriptionLabel
    
    case redButton
    case greenButton
    case themeButton
    case plainButton
    
    var theme : ThemeStyle {
        switch self {
//-------------------------------LABEL-------------------------------
        case .title :
            return ThemeStyle(textColor: .primaryText, backGroundColor: UIColor.clear, fontName: .bold, fontSize: 17)
            
        case .centerLabel:
            return ThemeStyle(textColor: .primaryText, backGroundColor: .clear, fontName: .bold, fontSize: 16)
            
        case .descriptionLabel:
            return ThemeStyle(textColor: .gray, backGroundColor: UIColor.clear, fontName: .medium, fontSize: 15)
            
//-------------------------------BUTTON-------------------------------
        case .redButton:
            return ThemeStyle(textColor: .red, backGroundColor: UIColor.clear, fontName: .bold, fontSize: 14)
            
        case .greenButton:
            return ThemeStyle(textColor: .green, backGroundColor: UIColor.clear, fontName: .bold, fontSize: 14)
            
        case .themeButton:
            return ThemeStyle(textColor: .primaryBackground, backGroundColor: .primaryText, fontName: .bold, fontSize: 15)
            
        case .plainButton:
            return ThemeStyle(textColor: .primaryText, backGroundColor: .clear, fontName: .bold, fontSize: 15)
            
//-------------------------------VIEW-------------------------------
            
        }
    }
}
