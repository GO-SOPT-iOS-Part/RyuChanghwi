//
//  MyPageHeaderView.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/03.
//

import UIKit
import SnapKit

final class MyPageHeaderView : UITableViewHeaderFooterView {
    static let headerViewID = "MyPageHeaderView"
    
    private let profileBackView = UIView()
    
    private let myImageView = UIImageView().then {
        $0.image = .bearsImage
        $0.layer.cornerRadius = 15
    }
    
    private let myNameLabel = UILabel().then {
        $0.text = "Doosan"
        $0.font = .pretendard(.medium, size: 17)
        $0.textColor = .colorFFFFFF
    }
    
    private let switchProfileButton = UIButton().then {
        $0.setTitle("프로필 전환", for: .normal)
        $0.setTitleColor(UIColor.colorD6D6D6, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.medium, size: 10)
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color2E2E2E.cgColor
    }
    
    private let purchaseLicenseBackView = UIView().then {
        $0.backgroundColor = UIColor.color191919
        $0.layer.cornerRadius = 3
    }
    private let myLicenseBackView = UIView()
    
    private let tivingCashBackView = UIView()

    private let myLicenseImageView = UIImageView().then {
        $0.image = .myLicenseImage
    }
    
    private let myLicenseInfoLabel = UILabel().then {
        $0.text = "나의 이용권"
        $0.font = .pretendard(.medium, size: 13)
        $0.textColor = .color626262
    }
    
    private let myLicenseLabel = UILabel().then {
        $0.text = "사용중인 이용권이 없습니다."
        $0.font = .pretendard(.medium, size: 13)
        $0.textColor = .color626262
    }
    
    
    private let tvingCashImageView = UIImageView().then {
        $0.image = .tvingCashImage
    }
    
    private let tvingCahsInfoLabel = UILabel().then {
        $0.text = "티빙캐시"
        $0.font = .pretendard(.medium, size: 13)
        $0.textColor = .color626262
    }
    
    private let tvingCashLabel = UILabel().then {
        $0.text = "0"
        $0.textColor = .colorFFFFFF
        $0.font = .pretendard(.bold, size: 15)
    }
    
    private let licenseInfoBackView = UIView().then {
        $0.backgroundColor = .color191919
        $0.layer.cornerRadius = 3
    }
    
    private let licenseInfoFirstLineFirstLabel = UILabel().then {
        $0.text = "이용권을 구매하고"
        $0.textColor = .color9C9C9C
        $0.font = UIFont.pretendard(.semiBold, size: 12)
    }
    
    private let tvnImageView = UIImageView().then {
        $0.image = .tvnImage
    }
    
    private let jtbcImageView = UIImageView().then {
        $0.image = .jtbcImage
    }
    
    private let licenseInfoFirstLineSecondLabel = UILabel().then {
        $0.text = "등 인기 TV프로그램과"
        $0.textColor = .color9C9C9C
        $0.font = UIFont.pretendard(.semiBold, size: 12)
    }
    
    private let licenseInfoSecondLineLabel = UILabel().then {
        $0.text = "다양한 영화 콘텐츠를 자유롭게 시청하세요!"
        $0.textColor = .color9C9C9C
        $0.font = UIFont.pretendard(.semiBold, size: 12)
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupLayout() {
        [profileBackView, purchaseLicenseBackView, licenseInfoBackView].forEach {
            self.addSubview($0)
        }
        [myImageView, myNameLabel, switchProfileButton].forEach {
            profileBackView.addSubview($0)
        }
        [myLicenseBackView, tivingCashBackView].forEach {
            purchaseLicenseBackView.addSubview($0)
        }
        [myLicenseImageView, myLicenseInfoLabel, myLicenseLabel].forEach {
            myLicenseBackView.addSubview($0)
        }
        [tvingCashImageView, tvingCahsInfoLabel, tvingCashLabel].forEach {
            tivingCashBackView.addSubview($0)
        }
        
        [licenseInfoFirstLineFirstLabel, licenseInfoFirstLineSecondLabel, licenseInfoSecondLineLabel, tvnImageView, jtbcImageView].forEach {
            licenseInfoBackView.addSubview($0)
        }

        
    }
    func setupConstraints() {
        profileBackView.snp.makeConstraints {
            $0.height.equalTo(132)
            $0.top.leading.trailing.equalToSuperview()
        }
        myImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(24)
            $0.height.equalTo(74)
            $0.width.equalTo(72)
        }
        myNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(myImageView.snp.trailing).offset(22)
        }
        switchProfileButton.snp.makeConstraints {
            $0.height.equalTo(25)
            $0.width.equalTo(70)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(23)
        }
        purchaseLicenseBackView.snp.makeConstraints {
            $0.top.equalTo(profileBackView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        myLicenseBackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        myLicenseImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
            $0.height.width.equalTo(23)
        }
        myLicenseInfoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(myLicenseImageView.snp.trailing).offset(5)
        }
        myLicenseLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(13)
        }
        tivingCashBackView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(46)
        }
        tvingCashImageView.snp.makeConstraints {
            $0.height.width.equalTo(23)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(11)
        }
        tvingCahsInfoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(tvingCashImageView.snp.trailing).offset(5)
        }
        tvingCashLabel.snp.makeConstraints {
            $0.centerY.trailing.equalToSuperview().inset(13)
        }
        
        
        licenseInfoBackView.snp.makeConstraints {
            $0.top.equalTo(purchaseLicenseBackView.snp.bottom).offset(12)
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(24)
        }
        
        licenseInfoFirstLineFirstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(18)
        }
        tvnImageView.snp.makeConstraints {
            $0.centerY.equalTo(licenseInfoFirstLineFirstLabel.snp.centerY)
            $0.leading.equalTo(licenseInfoFirstLineFirstLabel.snp.trailing).offset(6)
        }
        jtbcImageView.snp.makeConstraints {
            $0.centerY.equalTo(licenseInfoFirstLineFirstLabel.snp.centerY)
            $0.leading.equalTo(tvnImageView.snp.trailing).offset(4)
        }
        licenseInfoFirstLineSecondLabel.snp.makeConstraints {
            $0.centerY.equalTo(licenseInfoFirstLineFirstLabel.snp.centerY)
            $0.leading.equalTo(jtbcImageView.snp.trailing).offset(6)
        }
        licenseInfoSecondLineLabel.snp.makeConstraints {
            $0.top.equalTo(licenseInfoFirstLineFirstLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(18)
        }
    }
}
