//
//  UIView.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/05.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
