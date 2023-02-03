//
//  GExtension+String.swift
//  CodeRevisor
//
//  Created by Sanket on 22/09/20.
//  Copyright © 2020 Sanket. All rights reserved.
//

import UIKit

//Minimum eight characters, at least one letter and one number:
//      "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"

//Minimum eight characters, at least one letter, one number and one special character:
//      "^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$"

//Minimum eight characters, at least one uppercase letter, one lowercase letter and one number:
//      "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$"

//Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:
//      "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"

//Minimum eight and maximum 10 characters, at least one uppercase letter, one lowercase letter, one number and one special character:
//      "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,10}$"

extension String {
    enum ValidationType: String {
        case alphabet = "[A-Za-z]+"
        case alphabetWithSpace = "[A-Za-z ]*"
        case alphabetNum = "[A-Za-z-0-9]*"
        case alphabetNumWithSpace = "[A-Za-z0-9 ]*"
        case emailPrefix = "[A-Za-z0-9 _.]*"
        case userName = "[A-Za-z0-9 _]*"
        case name = "^[A-Z a-z]*$"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        case number = "[0-9]+"
        case password = "^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$"
        case mobileNumber = "^[0-9]{8,11}$"
//        case postalCode = "^[A-Za-z0-9- ]{1,10}$"
//        case zipcode = "^[A-Za-z0-9]{4,}$"
//        case currency = "^([0-9]+)(\\.([0-9]{0,2})?)?$"
//        case amount = "^\\s*(?=.*[1-9])\\d*(?:\\.\\d{1,2})?\\s*$"
//        case website = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
    }
    
    func isValid(_ type: ValidationType) -> Bool {
        guard !isEmpty else { return false }
        let regTest = NSPredicate(format: "SELF MATCHES %@", type.rawValue)
        return regTest.evaluate(with: self)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func removeAllSpace() -> String {
        return self.replacingOccurrences(of: "\\s", with: "", options: .regularExpression)
    }
    
    func url() -> URL {
        guard let url = URL(string: self) else {
            return URL(string : "www.google.co.in")!
        }
        return url
    }
    
    func isBackspace() -> Bool {
        let  char = self.cString(using: String.Encoding.utf8)!
        let isBackSpace = strcmp(char, "\\b")
        if (isBackSpace == -92) {
            return true
        }
        return false
    }
    
    func last(index: Int) -> String? {
        guard count > index else { return nil }
        return self.reversed()[index].description
    }
    
    func getHashtags() -> [String]? {
        let hashtagDetector = try? NSRegularExpression(pattern: "#(\\w+)", options: NSRegularExpression.Options.caseInsensitive)
        let results = hashtagDetector?.matches(in: self, options: NSRegularExpression.MatchingOptions.withoutAnchoringBounds, range: NSMakeRange(0, self.utf16.count)).map { $0 }
        
        return results?.map({
            (self as NSString).substring(with: $0.range(at: 1)).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        })
    }
    
    func unescapeString() -> String {
        return self.replacingOccurrences(of: "\\", with: "", options: String.CompareOptions.literal, range: nil)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    func width(withConstraintedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.width
    }
    
    func sizeOfString (font : UIFont) -> CGSize {
        return self.boundingRect(with: CGSize(width: Double.greatestFiniteMagnitude, height: Double.greatestFiniteMagnitude),
                                 options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                 attributes: [NSAttributedString.Key.font: font],
                                 context: nil).size
    }
 
    /**
     To get attributed underline text
     
     - Returns: attributed underline text
     */
    func addUnderline() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                      value: NSUnderlineStyle.thick.rawValue,
                                      range: NSRange(location: 0, length: attributedString.length))
        return attributedString
    }
}

//typealias AlertActionHandlerd = ((UIAlertAction) -> Void)


extension String {
    func numberToLocale(localeIdentifier: String = "EN") -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: localeIdentifier)
        guard let resultNumber = numberFormatter.number(from: self) else{
            return self
        }
        return resultNumber.stringValue
    }
}

// -----------------------------------------------------------------------------------------------------------------------------

extension String {
    func safelyLimitedTo(length n: Int)->String {
        if (self.count <= n) {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}
