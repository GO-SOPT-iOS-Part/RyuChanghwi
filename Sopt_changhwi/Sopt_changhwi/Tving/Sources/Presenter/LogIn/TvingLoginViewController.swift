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
    ///TvingUserNameViewController에서 받는 userName
    var userName : String?
    //MARK: - PROPERTIES
    private let backgroundView = UIView().then {
        $0.backgroundColor = UIColor.color000000
        $0.layer.opacity = 0.5
    }
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
        $0.isSecureTextEntry = true
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
    private let passwordTextRemoveButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        $0.tintColor = .color626262
    }
    
    private let passwordTextSecureToggleButton = UIButton().then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .color626262
    }
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        extensions()
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    ///extionsions으로 속성 수정
    private func extensions() {
        createAccountButton.setUnderline()
        idTextField.setPlaceholderColor(UIColor.color9C9C9C)
        passwordTextField.setPlaceholderColor(UIColor.color9C9C9C)
        passwordTextField.addLeftPadding(leftPadding: 22)
        idTextField.addLeftPadding(leftPadding: 22)
        passwordTextField.addRightPadding(rightPadding: 86)
        idTextField.addRightPadding(rightPadding: 22)
    }
    
    //MARK: - ACTIONS
    private func actions() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        passwordTextRemoveButton.addTarget(self, action: #selector(passwordTextRemoveButtonTapped), for: .touchUpInside)
        passwordTextSecureToggleButton.addTarget(self, action: #selector(passwordTextSecureToggleButtonTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
    }
    @objc func loginButtonTapped(_ sender : UITextField) {
        let tvingHomeViewController = TvingHomeViewController()
        tvingHomeViewController.modalTransitionStyle = .crossDissolve
        tvingHomeViewController.modalPresentationStyle = .fullScreen
        ///userName이 있다면 userName 넘겨주기
        if let userName = userName {
            tvingHomeViewController.userInfoText = userName
        }
        ///없다면 id 넘겨주기
        else {
            tvingHomeViewController.userInfoText = idTextField.text ?? ""
        }
        present(tvingHomeViewController, animated: true)
    }
    @objc func passwordTextRemoveButtonTapped() {
        ///비밀번호 값 초기화
        passwordTextField.text = ""
    }
    @objc func passwordTextSecureToggleButtonTapped(_ sender : UIButton) {
        ///비밀번호 secure 토글
        sender.isSelected = !sender.isSelected
        passwordTextSecureToggleButton.setImage(sender.isSelected ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash") , for: .normal)
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    @objc func createAccountButtonTapped() {
        let tvingUserNameBottomSheetViewController = TvingUserNameBottomSheetViewController()
        tvingUserNameBottomSheetViewController.modalTransitionStyle = .coverVertical
        tvingUserNameBottomSheetViewController.modalPresentationStyle = .overFullScreen
        ///바텀시트의 backgroundView 보이기
        backgroundView.isHidden = false
        ///tvingUserNameBottomsheetViewController dismiss  시 클로저로 background hidden
        tvingUserNameBottomSheetViewController.backgroundHiddenCompletionHandler = { [weak self] value in
            guard let self else { return }
            self.backgroundView.isHidden = value
        }
        ///tvingUserNameBottomsheetViewController dismiss  시 클로저로 userName 받아오기
        tvingUserNameBottomSheetViewController.nickNameCompletionHandler = { [weak self] value in
            guard let self else { return }
            self.userName = value
        }
        present(tvingUserNameBottomSheetViewController, animated: true)
    }
}

//MARK: - EXTENSION
private extension TvingLoginViewController {
    func enabledLoginButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor.colorFF143C
        loginButton.layer.borderColor = UIColor.colorFF143C.cgColor
        loginButton.setTitleColor(UIColor.colorFFFFFF, for: .normal)
    }
    func disenabledLoginButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = UIColor.color000000
        loginButton.layer.borderColor = UIColor.color2E2E2E.cgColor
        loginButton.setTitleColor(UIColor.color9C9C9C, for: .normal)
    }
    ///이메일 정규식
    func isValidEmail(email: String) -> Bool {
        let emailRegex = #"^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    ///비밀번호 정규식
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    
    func style() {
        view.backgroundColor = UIColor.color000000
        backgroundView.isHidden = true
    }
    func setLayout() {
        [tvingLoginLabel, idTextField, passwordTextField, loginButton, findStackView, accountStackView, passwordTextRemoveButton, passwordTextSecureToggleButton, backgroundView].forEach {
            view.addSubview($0)
        }
        [findIdButton, separateView, findPasswordButton].forEach {
            findStackView.addArrangedSubview($0)
        }
        [createAccoundLabel, createAccountButton].forEach {
            accountStackView.addArrangedSubview($0)
        }
        backgroundView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
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
        passwordTextSecureToggleButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextField.snp.trailing).offset(-20)
            $0.width.equalTo(20)
            $0.height.equalTo(52)
        }
        passwordTextRemoveButton.snp.makeConstraints {
            $0.centerY.equalTo(passwordTextField)
            $0.trailing.equalTo(passwordTextSecureToggleButton.snp.leading).offset(-16)
            $0.width.equalTo(20)
            $0.height.equalTo(52)
        }
    }
}
extension TvingLoginViewController : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = (textField.text ?? "") as NSString
        let newText = currentText.replacingCharacters(in: range, with: string)
        
        ///idTextField일 시
        if textField == idTextField {
            let isValidEmail = isValidEmail(email: newText)
            ///passwordTextField.text 값이 정규식인 상태에서 idValid일 시
            if isValidEmail && isValidPassword(password: passwordTextField.text ?? "") {
                ///로그인 버튼 활성화
                enabledLoginButton()
            }
            else {
                ///로그인 버튼 비활성화
                disenabledLoginButton()
            }
        }
        ///passwordTextField일 시
        else if textField == passwordTextField {
            let isValidPassword = isValidPassword(password: newText)
            ///idTextField.text 값이 정규식인 상태에서 passwordValid일 시
            if isValidPassword && isValidEmail(email: idTextField.text ?? "") {
                ///로그인 버튼 활성화
                enabledLoginButton()
            }
            else {
                ///로그인 버튼 비활성화 
                disenabledLoginButton()
            }
        }
        return true
    }

}
