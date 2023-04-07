//
//  FIrstSeminarViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/01.
//

import UIKit

class FirstSeminarViewController : UIViewController {
    //MARK: - PROPERTIES
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "나의 이름은"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    private let pushButton : UIButton = {
        let button = UIButton()
        button.setTitle("푸시눌러줘~", for: .normal)
        button.setTitle("푸시눌렸다~", for: .highlighted)
        button.backgroundColor = .yellow
        button.setTitleColor(.red, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        return button
    }()
    private let presentButton : UIButton = {
        let button = UIButton()
        button.setTitle("프리젠트눌러줘~", for: .normal)
        button.setTitle("프리젠트눌렸다~", for: .highlighted)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    private let nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 알려주세요~"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let toggleBaseView : UIView = {
       let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.blue.cgColor
        return view
    }()
    private let toggleLabel : UILabel = {
       let label = UILabel()
        label.text = "블루"
        return label
    }()
    private let toggleSwitch : UISwitch = {
        let buttonSwitch : UISwitch = UISwitch()
        buttonSwitch.isOn = true
        return buttonSwitch
    }()
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
        actions()
        toggleSwitch.isOn = true
    }
    //MARK: - ACTIONS
    func actions() {
        presentButton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        pushButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        toggleSwitch.addTarget(self, action: #selector(toggleSwitchTapped(sender:)), for: .valueChanged)
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
    @objc func toggleSwitchTapped(sender: UISwitch) {
        if sender.isOn {
            toggleLabel.text = "블루~"
            toggleBaseView.layer.borderColor = UIColor.blue.cgColor
        }
        else {
            toggleLabel.text = "레드~"
            toggleBaseView.layer.borderColor = UIColor.red.cgColor
        }
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
            presentButton, pushButton, toggleBaseView, toggleLabel, toggleSwitch].forEach {
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
        
        NSLayoutConstraint.activate([toggleBaseView.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 20),
                                     toggleBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                                     toggleBaseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
                                     toggleBaseView.heightAnchor.constraint(equalToConstant: 100)
                                    ])
        
        NSLayoutConstraint.activate([toggleLabel.topAnchor.constraint(equalTo: toggleBaseView.topAnchor, constant: 10),
                                     toggleLabel.centerXAnchor.constraint(equalTo: toggleBaseView.centerXAnchor)
                                    ])
        NSLayoutConstraint.activate([toggleSwitch.topAnchor.constraint(equalTo: toggleLabel.bottomAnchor, constant: 10),
                                     toggleSwitch.centerXAnchor.constraint(equalTo: toggleBaseView.centerXAnchor)
        
        ])
            
       }
    
}
