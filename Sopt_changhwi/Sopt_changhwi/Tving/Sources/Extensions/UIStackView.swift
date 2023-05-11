//
//  UIStackView.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/05.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
