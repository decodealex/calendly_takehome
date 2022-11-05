//
//  String+UIColor.swift
//  takehome
//
//

import UIKit

extension String {
    var color: UIColor? {
        guard self.count == 7 && self.hasPrefix("#") else { return nil }

        let scanner = Scanner(string: String(self.suffix(6)))
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        let returnColor = UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
        return returnColor
    }
}

