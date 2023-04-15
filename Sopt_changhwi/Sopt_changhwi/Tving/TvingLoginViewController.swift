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
        $0.textColor = UIColor.colorFFFFFF
        $0.layer.cornerRadius = 3
    }
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = UIFont.pretendard(.semiBold, size: 15)
        $0.textColor = UIColor.colorFFFFFF
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
    private let findIdButton = UIButton().then {
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
    }
    
    private let separateView = UIView().then {
        $0.backgroundColor = UIColor.color2E2E2E
    }
    
    private let findPasswordButton = UIButton().then {
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
    }
    
    private let findStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 36
    }
    
    private let createAccoundLabel = UILabel().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = UIColor.color626262
        $0.font = UIFont.pretendard(.semiBold, size: 14)
    }
    
    private let createAccountButton = UIButton().then {
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(.regular, size: 14)
    }
    private let accountStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 17
    }
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        extensions()
    }
    
    private func extensions() {
        createAccountButton.setUnderline()
        idTextField.setPlaceholderColor(UIColor.color9C9C9C)
        passwordTextField.setPlaceholderColor(UIColor.color9C9C9C)
    }
    
    //MARK: - ACTIONS
    private func actions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    @objc func loginButtonTapped() {
        let tvingHomeViewController = TvingHomeViewController()
        tvingHomeViewController.modalTransitionStyle = .crossDissolve
        tvingHomeViewController.modalPresentationStyle = .fullScreen
        present(tvingHomeViewController, animated: true)
    }
}

//MARK: - EXTENSION
private extension TvingLoginViewController {
    ///이메일 정규식
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    ///비밀번호 정규식
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = #"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"#
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    
    func style() {
        view.backgroundColor = UIColor.color000000
    }
    func setLayout() {
        [tvingLoginLabel, idTextField, passwordTextField, loginButton, findStackView, accountStackView].forEach {
            view.addSubview($0)
        }
        [findIdButton, separateView, findPasswordButton].forEach {
            findStackView.addArrangedSubview($0)
        }
        [createAccoundLabel, createAccountButton].forEach {
            accountStackView.addArrangedSubview($0)
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
        findStackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
        
        separateView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
        accountStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(findStackView.snp.bottom).offset(28)
        }
        createAccoundLabel.snp.makeConstraints {
            $0.height.equalTo(22)
        }
        createAccountButton.snp.makeConstraints {
            $0.width.equalTo(128)
            $0.height.equalTo(22)
        }
    }
}
