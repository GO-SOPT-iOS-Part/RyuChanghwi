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
    // MARK: - PROPERTIES
    private let tvingImageView = UIImageView().then {
        $0.image = UIImage(named: "tvingImage")
    }
    
    private let greetingLabel = UILabel().then {
        $0.numberOfLines = 2
//        $0.text = "dddd \n 반가워요"
        $0.font = UIFont.pretendard(.bold, size: 23)
        $0.textColor = UIColor.colorD6D6D6
        $0.textAlignment = .center
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("메인으로", for: .normal)
        $0.setTitleColor(UIColor.colorFFFFFF, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.backgroundColor = UIColor.colorFF133C
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        spaceLines(label: greetingLabel, lineHeight: 1.33)
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
    ///줄 간격 벌리기
    func spaceLines(label : UILabel, lineHeight : Double) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        let stringValue = NSMutableAttributedString(string: label.text ?? "")
        stringValue.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, stringValue.length))
        label.attributedText = stringValue
    }
    
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

