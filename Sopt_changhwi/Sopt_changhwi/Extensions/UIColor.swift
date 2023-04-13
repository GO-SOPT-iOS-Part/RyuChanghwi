//
//  UIColor.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/13.
//

import UIKit

extension UIColor {
    static let colorFFFFFF = UIColor(hex: 0xFFFFFF)
    static let color000000 = UIColor(hex: 0x000000)
    static let colorFF133C = UIColor(hex: 0xFF143C)
    static let color2E2E2E = UIColor(hex: 0x2E2E2E)
    static let color626262 = UIColor(hex: 0x626262)
    static let color9C9C9C = UIColor(hex: 0x9C9C9C)
    static let colorD6D6D6 = UIColor(hex: 0xD6D6D6)
}

extension UIColor {
    /// hex code를 이용하여 정의
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
