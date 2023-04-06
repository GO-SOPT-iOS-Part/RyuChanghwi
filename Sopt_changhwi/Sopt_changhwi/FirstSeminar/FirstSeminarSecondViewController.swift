//
//  FirstSeminarSecondViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/01.
//

import UIKit

final class FirstSeminarSecondViewController : UIViewController {
    // MARK: - PROPERTIES
    private let nameLabel: UILabel = {
            let label = UILabel()
            label.text = "제 이름은요!"
            label.font = .boldSystemFont(ofSize: 20)
            return label
        }()
    private lazy var backButton: UIButton = {
            let button = UIButton()
            button.setTitle("뒤로가기", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.titleLabel?.font = .boldSystemFont(ofSize: 20)
            return button
        }()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
    }
    
    // MARK: - ACTIONS
    func actions() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    @objc func backButtonTapped() {
        if navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    func dataBind(name : String) {
        nameLabel.text = name
    }
}

// MARK: - EXTENSIONS

private extension FirstSeminarSecondViewController {
    func style() {
           
           view.backgroundColor = .white
       }
       
       func setLayout() {
           
           [nameLabel, backButton].forEach {
               $0.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview($0)
           }
           
           NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                        nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
       
           
           NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                        backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                        backButton.heightAnchor.constraint(equalToConstant: 48)])
       }
}
