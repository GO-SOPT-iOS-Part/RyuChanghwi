//
//  BaseUIVIew.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/03.
//

import UIKit

class BaseUIView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
        setupConstraints()
    }
    
    // MARK: - 서브뷰 추가 함수
    func setupLayout() {
        /// Override Layout
        /// addSubview
    }
    // MARK: - 레이아웃 정의 함수
    func setupConstraints() {
        /// Override Constraints
        /// snapkit
    }
}
