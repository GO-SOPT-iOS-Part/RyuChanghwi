//
//  SecondSeminarSecondViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/08.
//

import UIKit

protocol DataBindProtocel : AnyObject { //Class에서만 사용하겠다 -> weak로 사용해 메모리 누수를 발생시키지 않게끔 AnyObject 사용
    func dataBind(text: String)
}

class SecondSeminarSecondViewController : UIViewController {
    
//    var completionHander: ((String) -> (Void))
    typealias handler = ((String) -> (Void))
    var completionHandler : handler?
    
    weak var delegate: DataBindProtocel?
    
    
    // MARK: - PROPERTIES
    private let nameLabel: UILabel = {
           let label = UILabel()
           label.text = "이름이 무엇인가요!?"
           label.font = .systemFont(ofSize: 16)
           label.textColor = .blue
           label.textAlignment = .center
           return label
       }()
       
       private let nameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "이름을 입력해주세요"
           textField.clearButtonMode = .whileEditing
           textField.layer.borderColor = UIColor.gray.cgColor
           textField.layer.borderWidth = 1
           return textField
       }()
       
       private lazy var backButton: UIButton = {
           let button = UIButton()
           button.setTitle("뒤로가기!", for: .normal)
           button.backgroundColor = .yellow
           button.setTitleColor(.blue, for: .normal)
           button.addTarget(self,
                            action: #selector(popSecondViewController),
                            for: .touchUpInside)
           return button
       }()
       
        //MARK: - LLIFECYCLE
       override func viewDidLoad() {
           super.viewDidLoad()
           
           style()
           setLayout()
       }
    
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension SecondSeminarSecondViewController {
    func style() {
            
            view.backgroundColor = .white
        }
        
        func setLayout() {
            
            [nameLabel, nameTextField, backButton].forEach {
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
            
            NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                         backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                         backButton.heightAnchor.constraint(equalToConstant: 48)])
        }

            
        @objc func popSecondViewController() {
            
            //델리게이트
            if let text = nameTextField.text {
                delegate?.dataBind(text: text)
            }
            
            //클로저
            guard let text2 = nameTextField.text else { return }
            completionHandler?(text2)
            
            
            self.navigationController?.popViewController(animated: true)
        }
}

