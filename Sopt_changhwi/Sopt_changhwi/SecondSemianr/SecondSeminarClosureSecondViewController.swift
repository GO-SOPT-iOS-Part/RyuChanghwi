//
//  SecondSeminarClosureSecondViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/08.
//

import UIKit
class SecondSeminarClosureSecondViewController : UIViewController {
    typealias handler = ((Int) -> (Void))
    var completionHandler : handler?
    var count : Int = 0
    // MARK: - PROPERTIES
    
    private let countAlertLabel = UILabel().then {
        $0.text = "횟수는?!"
        $0.textColor = .blue
    }
    
    private let backButton = UIButton().then {
        $0.setTitle("뒤로가기", for: .normal)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 10
    }
    private let countTapButton = UIButton().then {
        $0.setTitle("눌러줘", for: .normal)
        $0.setTitle("눌려따", for: .highlighted)
        $0.backgroundColor = .blue
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        action()
        setLayout()
    }
    
}
// MARK: - EXTENSIONs
extension SecondSeminarClosureSecondViewController {
    func style() {
        view.backgroundColor = .white
    }
    // MARK: - ACTIONS
    func action() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        countTapButton.addTarget(self, action: #selector(countTapButtonTapped), for: .touchUpInside)
    }
    @objc func backButtonTapped() {
        completionHandler?(count)
        dismiss(animated: true)
    }
    @objc func countTapButtonTapped() {
        count += 1
    }
    
    func setLayout() {
        [countAlertLabel, backButton, countTapButton].forEach {
            view.addSubview($0)
        }
        countAlertLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        countTapButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(countAlertLabel.snp.bottom).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
        }
        backButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(countTapButton.snp.bottom).offset(10)
            $0.height.equalTo(50)
            $0.width.equalTo(150)
        }
    }
}

