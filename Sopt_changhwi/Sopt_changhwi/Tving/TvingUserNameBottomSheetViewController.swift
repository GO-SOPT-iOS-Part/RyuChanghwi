//
//  TvingUserNameBottomSheetViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/16.
//

import UIKit

class TvingUserNameBottomSheetViewController : UIViewController {
    ///dismiss시 넘겨줄 데이터 클로저
    typealias completionHandler<T> = ((T) -> (Void))
    var backgroundHiddenCompletionHandler : completionHandler<Bool>?
    var nickNameCompletionHandler : completionHandler<String>?
    
    // MARK: - PROPERTIES
    private let bottomSheetView = UIView().then {
        $0.backgroundColor = UIColor.colorFFFFFF
    }
    private let separateView = UIView().then {
        $0.backgroundColor = .colorEFF2F4
        $0.layer.cornerRadius = 5
    }
    private let closeBottomSheetButton = UIButton()
    private let inputUserNickNameLabel = UILabel().then {
        $0.text = "닉네임을 입력해주세요"
        $0.textColor = UIColor.color000000
        $0.font = UIFont.pretendard(.medium, size: 23)
    }
    private let nickNameTextField = UITextField().then {
        $0.backgroundColor = UIColor.color9C9C9C
        $0.layer.cornerRadius = 3
    }
    
    private let saveButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.setTitle("저장하기", for: .normal)
        $0.backgroundColor = UIColor.color000000
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
        $0.layer.borderColor = UIColor.color2E2E2E.cgColor
        $0.setTitleColor(UIColor.color9C9C9C, for: .normal)
    }
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        nickNameTextField.delegate = self
    }
    
    // MARK: - ACTIONS
    private func actions() {
        closeBottomSheetButton.addTarget(self, action: #selector(closeBottomSheetButtonTapped), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    @objc func closeBottomSheetButtonTapped() {
        dismiss(animated: true)
        backgroundHiddenCompletionHandler?(true)
    }
    @objc func saveButtonTapped() {
        dismiss(animated: true)
        backgroundHiddenCompletionHandler?(true)
        nickNameCompletionHandler?(nickNameTextField.text ?? "")
    }
}
// MARK: - EXTENSIONs
extension TvingUserNameBottomSheetViewController {
    func style() {
        view.backgroundColor = .clear
        
    }
    func setLayout() {
        [bottomSheetView, closeBottomSheetButton, inputUserNickNameLabel, saveButton, separateView, nickNameTextField].forEach {
            view.addSubview($0)
        }
        bottomSheetView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(view.frame.height / 2)
        }
        closeBottomSheetButton.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomSheetView.snp.top)
        }
        inputUserNickNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.top.equalTo(bottomSheetView.snp.top).offset(50)
        }
        saveButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(52)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
        separateView.snp.makeConstraints {
            $0.width.equalTo(56)
            $0.height.equalTo(7)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(bottomSheetView.snp.top).offset(-15)
        }
        nickNameTextField.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(inputUserNickNameLabel.snp.bottom).offset(21)
        }
    }
}

extension TvingUserNameBottomSheetViewController : UITextFieldDelegate {
    /// 텍스트 필드 입력 제한 로직 구현
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
                
        /// 입력된 문자열이 한글인지 검사
        let koreanPattern = "^[ㄱ-ㅎㅏ-ㅣ가-힣]*$"
        let koreanPredicate = NSPredicate(format: "SELF MATCHES %@", koreanPattern)
        let isKorean = koreanPredicate.evaluate(with: updatedText)
        ///textField의 text가 한국어만 입력되고 있을 때
        ///처음엔 단순히  if isKoean && updatedText.isEmpty 라고 조건문을 달았을 때
        ///UI상에는 한국어만 입력되지만 자판에는 영어를 눌렀을 때 updatedText.isEmpty는 false로 바뀜
        ///때문에 한국어만 들어오는 환경(조건문) 안에서 updatedText.isEmplty를 넣어줘 한국어가 입력되고 있는 상황 내에서 값의 유무를 알 수 있었음.
        if isKorean {
            ///text값이 없다면
            if updatedText.isEmpty {
                saveButton.isEnabled = false
                saveButton.backgroundColor = UIColor.color000000
                saveButton.layer.borderColor = UIColor.color2E2E2E.cgColor
                saveButton.setTitleColor(UIColor.color9C9C9C, for: .normal)
            }
            else {
            ///text값이 있다면
                saveButton.isEnabled = true
                saveButton.backgroundColor = UIColor.colorFF143C
                saveButton.layer.borderColor = UIColor.colorFF143C.cgColor
                saveButton.setTitleColor(UIColor.colorFFFFFF, for: .normal)
            }
        }
        ///isKoean으로 설정해, 한국어만 text에 입력되도록 만들어줌
        return isKorean
    }
}
