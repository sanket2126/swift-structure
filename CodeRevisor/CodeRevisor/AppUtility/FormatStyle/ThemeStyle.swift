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
    case descriptionLabel
    
    var theme : ThemeStyle {
        switch self {
        case .title :
            return ThemeStyle(textColor: .primaryText, backGroundColor: UIColor.clear, fontName: .bold, fontSize: 17)
            
        case .descriptionLabel:
            return ThemeStyle(textColor: .gray, backGroundColor: UIColor.clear, fontName: .medium, fontSize: 15)
        }
    }
}
