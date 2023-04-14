//
//  TvingLoginViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/13.
//

import UIKit
import SnapKit
import Then

class TvingLoginViewController : UIViewController {
    //MARK: - PROPERTIES
    private let tvingLoginLabel = UILabel().then {
        $0.text = "TVING ID 로그인"
        $0.font = UIFont.pretendard(.medium, size: 23)
        $0.textColor = .colorD6D6D6
        $0.layer.cornerRadius = 3
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = UIFont.pretendard(.semiBold, size: 15)
        $0.backgroundColor = .color2E2E2E
        $0.layer.cornerRadius = 3
    }
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.backgroundColor = .color2E2E2E
    }
    private let loginButton = UIButton().then {
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.backgroundColor = .color000000
        $0.layer.cornerRadius = 3
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.color2E2E2E.cgColor
    }
    private let findIdButton = UIButton()
    
    private let separateView = UIView()
    
    private let findPasswordButton = UIButton()
    
    private let createAccoundLabel = UILabel()
    
    private let createAccountBUtton = UIButton()
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
}

//MARK: - EXTENSION
private extension TvingLoginViewController {
    func style() {
        view.backgroundColor = UIColor.color000000
    }
    func setLayout() {
        [tvingLoginLabel, idTextField, passwordTextField, loginButton].forEach {
            view.addSubview($0)
        }
        tvingLoginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(tvingLoginLabel.snp.bottom).offset(31)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(passwordTextField.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(52)
        }
    }
}
