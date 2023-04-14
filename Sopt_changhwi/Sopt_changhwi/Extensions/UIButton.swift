//
//  UIButton.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/15.
//

import UIKit

extension UIButton {
    ///버튼에 밑줄긋는 메서드
    func setUnderline() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                      value: NSUnderlineStyle.single.rawValue,
                                      range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
