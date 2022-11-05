//
//  UITableView+Utilities.swift
//  takehome
//
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.defaultReusableIdentifier)
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T where T: ReusableView {
        guard let reusableCell = dequeueReusableCell(withIdentifier: T.defaultReusableIdentifier, for: indexPath) as? T else {
            fatalError("dequeueReusableCell guarantee not satisfied.")
        }
        return reusableCell
    }
}
