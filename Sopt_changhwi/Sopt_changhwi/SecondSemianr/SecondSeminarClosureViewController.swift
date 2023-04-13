//
//  SecondSeminarClosureViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class SecondSeminarClosureViewController : UIViewController {
    // MARK: - PROPERTIES
    private let countLabel = UILabel().then {
        $0.text = "몇번 눌렸을까?"
        $0.backgroundColor = .black
        $0.textColor = .white
        $0.layer.cornerRadius = 10
        $0.textAlignment = .center
    }
    private let nextButton = UIButton().then {
        $0.setTitle("다음으로", for: .normal)
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
    }
    
}
// MARK: - EXTENSIONs
private extension SecondSeminarClosureViewController {
    func style() {
        view.backgroundColor = .white
    }
    // MARK: - ACTIONS
    func actions() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    @objc func nextButtonTapped() {
        let secondSeminarClosureSecondVC = SecondSeminarClosureSecondViewController()
        secondSeminarClosureSecondVC.modalTransitionStyle = .crossDissolve
        secondSeminarClosureSecondVC.modalPresentationStyle = .overFullScreen
        secondSeminarClosureSecondVC.completionHandler = { [weak self] count in
            guard let self else { return }
            self.countLabel.text = self.countAlert(count: count)
        }
        self.present(secondSeminarClosureSecondVC, animated: true)
    }
    
    func countAlert(count : Int) -> String {
        if count < 10 {
            return "\(count)번 입니다."
        }
        else {
            return "\(count)번이나 눌렀군요! "
        }
    }
    
    
    
    func setLayout() {
        [countLabel, nextButton].forEach {
            view.addSubview($0)
        }
        countLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.height.equalTo(100)
            $0.leading.equalToSuperview().offset(20)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(countLabel.snp.bottom).offset(20)
            $0.height.width.equalTo(100)
        }
    }
    
}

