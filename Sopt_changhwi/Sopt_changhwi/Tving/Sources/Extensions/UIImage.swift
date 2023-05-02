//
//  UIImage.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

extension UIImage {
    static var bearsImage : UIImage { UIImage(named: "bearsImage")! }
    static var tvingWhiteImage : UIImage { UIImage(named: "tvingWhiteImage")! }
    static var backImage : UIImage {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30)
        return UIImage(systemName: "chevron.left", withConfiguration: imageConfig)!.withTintColor(.colorFFFFFF, renderingMode: .alwaysOriginal) }
    static var bellImage : UIImage {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30)
        return UIImage(systemName: "bell", withConfiguration: imageConfig)!.withTintColor(.lightGray, renderingMode: .alwaysOriginal) }
    static var gearImage : UIImage {
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 30)
        return UIImage(systemName: "gearshape", withConfiguration: imageConfig)!.withTintColor(.lightGray, renderingMode: .alwaysOriginal) }
}
