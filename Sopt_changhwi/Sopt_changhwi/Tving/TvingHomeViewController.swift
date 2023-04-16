//
//  TvingHomeViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/15.
//

import UIKit
import SnapKit
import Then

class TvingHomeViewController : UIViewController {
    ///UI에 표시될 userInfo 값
    var userInfoText = ""
    // MARK: - PROPERTIES
    private let tvingImageView = UIImageView().then {
        $0.image = UIImage(named: "tvingImage")
    }
    
    private let greetingLabel = UILabel().then {
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(.bold, size: 23)
        $0.textColor = UIColor.colorD6D6D6
        $0.textAlignment = .center
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.backgroundColor = UIColor.colorFF143C
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        greetingLabel.text = "\(userInfoText) 님\n반가워요!"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ///텍스트가 정해지기 전 설정을 하면 작동하지 않음 -> 생명주기에 차이를 주기
        ///텍스트의 lineSpacing 설정
        greetingLabel.setLineSpacing(lineHeightMultiple: 1.33)
        ///텍스트 가운데 정렬
        greetingLabel.textAlignment = .center
    }

    
    // MARK: - ACTIONS
    private func actions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }

}
// MARK: - EXTENSIONs
extension TvingHomeViewController {
    func style() {
        view.backgroundColor = UIColor.color000000
    }
    func setLayout() {
        [tvingImageView, greetingLabel, backButton].forEach {
            view.addSubview($0)
        }
        tvingImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.width * 211 / 375)
        }
        greetingLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tvingImageView.snp.bottom).offset(66)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-66)
            $0.height.equalTo(52)
        }
    }
}

