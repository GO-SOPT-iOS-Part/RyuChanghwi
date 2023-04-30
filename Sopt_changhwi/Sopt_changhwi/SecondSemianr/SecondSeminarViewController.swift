//
//  SecondSeminarViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/08.
//

import UIKit
import SnapKit
import Then


final class SecondSeminarViewController : UIViewController {
    
    private let nameLabel: UILabel = {
           let label = UILabel()
           label.text = "이름이 무엇인가요!?"
           label.font = .systemFont(ofSize: 16)
           label.textColor = .blue
           label.textAlignment = .center
           return label
       }()
    private let secondNameLabel: UILabel = {
           let label = UILabel()
           label.text = "이름이 무엇인가요222"
           label.font = .systemFont(ofSize: 16)
           label.textColor = .blue
           label.textAlignment = .center
           return label
       }()
       
       private lazy var nextButton: UIButton = {
           let button = UIButton()
           button.setTitle("다음으로!", for: .normal)
           button.backgroundColor = .yellow
           button.setTitleColor(.blue, for: .normal)
           button.addTarget(self,
                            action: #selector(pushToSecondViewController),
                            for: .touchUpInside)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           style()
           setLayout()
       }
}

private extension SecondSeminarViewController {
    func style() {
            
            view.backgroundColor = .white
        }
        
        func setLayout() {
            
            [nameLabel, nextButton, secondNameLabel].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
            NSLayoutConstraint.activate([
                secondNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                secondNameLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -50)
            ])
            NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                         nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        
            
            NSLayoutConstraint.activate([nextButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                         nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                         nextButton.heightAnchor.constraint(equalToConstant: 48)])
        }

            
        @objc func pushToSecondViewController() {
            
            let secondViewController = SecondSeminarSecondViewController()
            secondViewController.delegate = self
            
            secondViewController.completionHandler = { [weak self] text in
                guard let self else { return }
                self.secondNameLabel.text = text
            }
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
}
extension SecondSeminarViewController: DataBindProtocel {
    func dataBind(text: String) {
        nameLabel.text = text
    }
}
