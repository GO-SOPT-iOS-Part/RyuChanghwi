//
//  MainViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

class MainViewController : BaseViewController {
    // MARK: - PROPERTIES
    private let bearsButton = UIButton().then {
        $0.setImage(.bearsImage, for: .normal)
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    override func setStyle() {
        super.setStyle()
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = bearsButton
        navigationItem.rightBarButtonItem = rightBarButton

    }
    override func setLayout() {
        super.setLayout()
    }
    
    // MARK: - ACTIONS
    override func actions() {
        super.actions()
        bearsButton.addTarget(self, action: #selector(bearsButtonTapped), for: .touchUpInside)
    }
    @objc func bearsButtonTapped() {
        let myPageViewController = MyPageViewController()
        myPageViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(myPageViewController, animated: true)
    }
}
// MARK: - EXTENSIONs
extension MainViewController {
    
}

