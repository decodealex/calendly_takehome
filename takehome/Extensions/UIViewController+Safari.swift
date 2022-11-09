//
//  UIViewController+Safari.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue
        present(safariVC, animated: true)
    }
}
