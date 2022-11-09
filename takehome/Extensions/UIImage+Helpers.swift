//
//  UIImage+Helpers.swift
//  takehome
//
//  Created by Alex Kovalyshyn on 08.11.2022.
//

import UIKit

extension UIImage {
    static func letterImage(from string: String) -> UIImage {
        let letter = string.first?.lowercased() ?? "a"
        let image = UIImage(systemName: "\(letter).circle.fill") ?? UIImage(systemName: "a.circle.fill")!
        return image
    }
}
