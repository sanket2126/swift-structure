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
    case redTitle
    case emailDomainText
    
    var theme : ThemeStyle {
        switch self {
        case .redTitle :
            return ThemeStyle(textColor: .red, backGroundColor: UIColor.clear, fontName: .bold, fontSize: 18)
            
        case .emailDomainText:
            return ThemeStyle(textColor: .black, backGroundColor: UIColor.clear, fontName: .regular, fontSize: 10)
        }
    }
}
