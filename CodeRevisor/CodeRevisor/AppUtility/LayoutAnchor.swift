//
//  UIView+Extension.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 12/01/23.
//

import UIKit

// MARK: Reference - https://gist.github.com/V8tr/3d28b3468bb60b02c5134d8d6ad78c43
// https://www.vadimbulavin.com/effective-auto-layout-programmatically-in-swift/

enum LayoutAnchor {
    case constant(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  constant: CGFloat)

    case relative(attribute: NSLayoutConstraint.Attribute,
                  relation: NSLayoutConstraint.Relation,
                  relatedTo: NSLayoutConstraint.Attribute,
                  multiplier: CGFloat,
                  constant: CGFloat)
}

// MARK: - Factory methods
extension LayoutAnchor {
    static let leading = relative(attribute: .leading, relation: .equal, relatedTo: .leading)
    static let trailing = relative(attribute: .trailing, relation: .equal, relatedTo: .trailing)
    static let top = relative(attribute: .top, relation: .equal, relatedTo: .top)
    static let bottom = relative(attribute: .bottom, relation: .equal, relatedTo: .bottom)

    static let centerX = relative(attribute: .centerX, relation: .equal, relatedTo: .centerX)
    static let centerY = relative(attribute: .centerY, relation: .equal, relatedTo: .centerY)

    static let leadingMargin = relative(attribute: .leading, relation: .equal, relatedTo: .leadingMargin)
    static let trailingMargin = relative(attribute: .trailing, relation: .equal, relatedTo: .trailingMargin)
    static let topMargin = relative(attribute: .top, relation: .equal, relatedTo: .topMargin)
    static let bottomMargin = relative(attribute: .bottom, relation: .equal, relatedTo: .bottomMargin)

    static let centerXMargin = relative(attribute: .centerX, relation: .equal, relatedTo: .centerXWithinMargins)
    static let centerYMargin = relative(attribute: .centerY, relation: .equal, relatedTo: .centerYWithinMargins)

    static let width = constant(attribute: .width, relation: .equal)
    static let height = constant(attribute: .height, relation: .equal)

    static func constant(attribute: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation) -> (CGFloat) -> LayoutAnchor {
        return { constant in
            .constant(attribute: attribute, relation: relation, constant: constant)
        }
    }

    static func relative( attribute: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation, relatedTo: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1) -> (CGFloat) -> LayoutAnchor {
        return { constant in
            .relative(attribute: attribute, relation: relation, relatedTo: relatedTo, multiplier: multiplier, constant: constant)
        }
    }
}

extension NSLayoutConstraint {
    convenience init(from: UIView, to item: UIView?, anchor: LayoutAnchor) {
        switch anchor {
        case let .constant(attribute: attr, relation: relation, constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: relation,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: constant
            )
        case let .relative(attribute: attr,
                           relation: relation,
                           relatedTo: relatedTo,
                           multiplier: multiplier,
                           constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: relation,
                toItem: item,
                attribute: relatedTo,
                multiplier: multiplier,
                constant: constant
            )
        }
    }
}

// MARK: - Conveniences
extension UIView {
    func addSubview(_ subview: UIView, anchors: [LayoutAnchor]) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.activate(anchors: anchors, relativeTo: self)
    }

    func activate(anchors: [LayoutAnchor], relativeTo item: UIView? = nil) {
        let constraints = anchors.map { NSLayoutConstraint(from: self, to: item, anchor: $0) }
        NSLayoutConstraint.activate(constraints)
    }
}
