//
//  ZigZagViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/08.
//

import UIKit

class ZigZagViewController : UIViewController {
    // MARK: - PROPERTIES
    private let yellowView = UIView().then {
        $0.backgroundColor = .yellow
    }
    private let greenView = UIView().then {
        $0.backgroundColor = .green
    }
    private let blackView = UIView().then {
        $0.backgroundColor = .black
    }
    private let blueView = UIView().then {
        $0.backgroundColor = .blue
    }
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setlayout()
    }
    
}
// MARK: - EXTENSIONs
private extension ZigZagViewController {
    func style() {
        view.backgroundColor = .white
    }
    func setlayout() {
        [yellowView, greenView, blackView, blueView].forEach {
            view.addSubview($0)
        }
        yellowView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalTo(height / 4)
            $0.width.equalTo(width / 2)
        }
        greenView.snp.makeConstraints {
            $0.leading.equalTo(yellowView.snp.trailing)
            $0.top.equalTo(yellowView.snp.bottom)
            $0.height.equalTo(height / 4)
            $0.width.equalTo(width / 2)
        }
        blackView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(greenView.snp.bottom)
            $0.height.equalTo(height / 4)
            $0.width.equalTo(width / 2)
        }
        blueView.snp.makeConstraints {
            $0.leading.equalTo(blackView.snp.trailing)
            $0.top.equalTo(blackView.snp.bottom)
            $0.height.equalTo(height / 4)
            $0.width.equalTo(width / 2)
        }
        
    }
}

