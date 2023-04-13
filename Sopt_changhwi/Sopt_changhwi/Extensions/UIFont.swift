//
//  UIFont.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/13.
//

import UIKit

extension UIFont {
    public enum PretendardType : String {
        case black = "Black"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case extraLight = "ExtraLight"
        case light = "Light"
        case medium = "Medium"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case thin = "Thin"
    }
    ///폰트 적용 함수
    static func pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}
