//
//  MyPageButtonCell.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/03.
//

import UIKit
import Then
import SnapKit

final class MyPageButtonCell : UITableViewCell {
    static let identifier = "MyPageButtonCell"
    private let buttonTitle = UILabel().then {
        $0.font = .pretendard(.medium, size: 15)
        $0.textColor = .color9C9C9C
    }
    private let buttonImageView = UIImageView().then {
        $0.image = .pushImage
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setStyle()
        setLayout()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setStyle() {
        contentView.backgroundColor = .color000000
    }
    func setLayout() {
        [buttonTitle, buttonImageView].forEach {
            contentView.addSubview($0)
        }
        buttonTitle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(18)
        }
        buttonImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
        }
    }
    func configureCell(_ myPageButton: MyPageButton) {
        buttonTitle.text = myPageButton.title
    }
}
