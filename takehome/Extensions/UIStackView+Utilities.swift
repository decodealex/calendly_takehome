//
//  UIStackView+Utilities.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 07.11.2022.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
