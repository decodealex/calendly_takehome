//
//  UIView+ReusableView.swift
//  takehome
//
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReusableIdentifier: String { get }
    static var nib: UINib? { get }
}

extension ReusableView where Self: UIView {
    static var defaultReusableIdentifier: String { return String(describing: self) }
    static var nib: UINib? { return nil }

    static func instantiate() -> Self? {
        return nib?.instantiate(withOwner: self, options: nil).first as? Self
    }
}
