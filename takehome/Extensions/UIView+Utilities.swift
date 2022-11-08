//
//  UIView+Utilities.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 07.11.2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
