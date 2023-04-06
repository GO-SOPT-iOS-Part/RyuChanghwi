//
//  FIrstSeminarViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/01.
//

import UIKit

class FirstSeminarViewController : UIViewController {
    //MARK: - PROPERTIES
    let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 이름은"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    let pushButton = {
        let button = UIButton()
        button.setTitle("푸시푸시", for: .highlighted)
        button.backgroundColor = .yellow
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        return button
    }()
    let presentButton = {
        let button = UIButton()
        button.setTitle("프리젠트", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    let nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 알려주세요~"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        return textField
    }()
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
    }
    //MARK: - ACTIONS
    func actions() {
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
    }
    
    @objc func presentButtonTapped() {
        let firstSeminarSecondViewController = FirstSeminarSecondViewController()
        if let name = nameTextField.text {
            firstSeminarSecondViewController.dataBind(name: name)
        }
        firstSeminarSecondViewController.modalTransitionStyle = .crossDissolve
        firstSeminarSecondViewController.modalPresentationStyle = .overFullScreen
        self.present(firstSeminarSecondViewController, animated: true)
        }
    @objc func pushButtonTapped() {
        let firstSeminarSecondViewCOntroller = FirstSeminarSecondViewController()
        guard let name = nameTextField.text else { return }
        firstSeminarSecondViewCOntroller.dataBind(name: name)
        self.navigationController?.pushViewController(firstSeminarSecondViewCOntroller, animated: true)
    }
}

//extension -> 확장을 시킨다~
//MARK: - EXTENSIONS
extension FirstSeminarViewController {
    func style() {
        view.backgroundColor = .white
    }
    func setLayout() {
           
           [nameLabel, nameTextField,
            presentButton, pushButton].forEach {
               $0.translatesAutoresizingMaskIntoConstraints = false
               view.addSubview($0)
           }
           
           NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                        nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
           
           NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                        nameTextField.heightAnchor.constraint(equalToConstant: 48)])
           
           NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                        presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                        presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                        presentButton.heightAnchor.constraint(equalToConstant: 48)])
           
           NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                        pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                        pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                        pushButton.heightAnchor.constraint(equalToConstant: 48)])
       }
    
}
