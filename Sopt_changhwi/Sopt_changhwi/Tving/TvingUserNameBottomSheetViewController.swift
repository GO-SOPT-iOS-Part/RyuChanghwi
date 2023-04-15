//
//  TvingUserNameBottomSheetViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/16.
//

import UIKit

class TvingUserNameBottomSheetViewController : UIViewController {
    var backgroundHiddenCompletionHandler : ((Bool) -> (Void))?
    var nickNameCompletionHandler : ((String) -> (Void))?
    
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
        $0.backgroundColor = UIColor.colorFF143C
        $0.titleLabel?.font = UIFont.pretendard(.semiBold, size: 14)
    }
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
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

