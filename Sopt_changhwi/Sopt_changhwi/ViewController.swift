//
//  ViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/01.
//

import UIKit

final class ViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "솝트에 오신 여러분 환영합니다!"
        return label
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
}

private extension ViewController {
    
    func setStyle() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nameLabel)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
