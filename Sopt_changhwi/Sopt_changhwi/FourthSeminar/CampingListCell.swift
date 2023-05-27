//
//  CampingLIstCell.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/12.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class CampingListCell : UITableViewCell {
    static let identifier = "CampingListCell"
    
    private lazy var campingImageView = UIImageView()
    private let campingNameLabel = UILabel()
    private let introLabel = UILabel()
    private let addressLabel = UILabel()
    
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
        // 줄 간격 없애는 왼쪽 기준으로 0
        separatorInset.left = 0
        // 터치 시 클릭 이벤트, 색상 없애기
        selectionStyle = .none
        
    }
    func setLayout() {
        [campingImageView, campingNameLabel, introLabel, addressLabel].forEach {
            contentView.addSubview($0)
        }
        campingImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview().inset(4)
            $0.height.width.equalTo(70)
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(10)
        }
        campingNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalTo(campingImageView.snp.trailing).offset(10)
        }
        introLabel.snp.makeConstraints {
            $0.top.equalTo(campingNameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(campingImageView.snp.trailing).offset(10)
        }
        addressLabel.snp.makeConstraints {
            $0.top.equalTo(introLabel.snp.bottom).offset(5)
            $0.leading.equalTo(campingImageView.snp.trailing).offset(10)
        }
    }
    func configureCell(_ camping : Item) {
        guard let url = URL(string: camping.firstImageUrl ?? "") else { return }
        campingImageView.kf.indicatorType = .activity
        campingImageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: nil,
            completionHandler: nil
          )
        campingNameLabel.text = "캠핑장 이름:" + (camping.facltNm ?? "")
        introLabel.text = camping.lineIntro
        addressLabel.text = camping.addr1
    }
}
