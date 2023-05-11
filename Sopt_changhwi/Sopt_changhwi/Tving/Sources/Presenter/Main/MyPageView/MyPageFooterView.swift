//
//  MyPageFooterView.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/03.
//

import UIKit
import SnapKit
import Then

final class MyPageFooterView : UITableViewHeaderFooterView {
    static let footerViewID = "MyPageFooterView"
    private let footerBackView = UIView()
    
    private let logOutButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupLayout() {
        [footerBackView, logOutButton].forEach {
            self.addSubview($0)
        }
    }
    func setupConstraints() {
        footerBackView.snp.makeConstraints {
            $0.height.equalTo(101)
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        logOutButton.snp.makeConstraints {
            $0.height.equalTo(55)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(footerBackView.snp.top).offset(23)
        }
    }
}
