//
//  UIView+Autolayout.swift
//  takehome
//
//

import UIKit

extension UIView {
    func pinEdgesToParent() {
        guard let parent = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leftAnchor.constraint(equalTo: parent.leftAnchor).isActive = true
        topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
        rightAnchor.constraint(equalTo: parent.rightAnchor).isActive = true
        bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
    }
}
