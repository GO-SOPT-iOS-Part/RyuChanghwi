//
//  TranslatesAutoresizeingPracticeVC.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/06.
//

import UIKit

class TranslatesAutoresizeingPracticeVC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let cv = UIView(frame: CGRect(x: 100, y: 100, width: 400, height: 400))
          cv.translatesAutoresizingMaskIntoConstraints = true
          cv.backgroundColor = .red
          self.view.addSubview(cv)

          cv.widthAnchor.constraint(equalToConstant: 50).isActive = true
          cv.heightAnchor.constraint(equalToConstant: 50).isActive = true
          cv.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100).isActive = true
          cv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 100).isActive = true
    }
}
