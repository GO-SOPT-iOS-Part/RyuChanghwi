//
//  UITextField.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/15.
//

import UIKit

extension UITextField {
    ///TextfieldPlaceHolderColor
    func setPlaceholderColor(_ color: UIColor) {
        guard let placeholder = self.placeholder else {
            return
        }
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color
        ]
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
    }
    func addRightPadding(rightPadding : CGFloat) {
      let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding, height: self.frame.height))
      self.rightView = paddingView
      self.rightViewMode = ViewMode.always
    }
    func addLeftPadding(leftPadding : CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
      }
}
