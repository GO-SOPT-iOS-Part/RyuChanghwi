//
//  MyPageViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

class MyPageViewController : BaseViewController {
    // MARK: - PROPERTIES
    private let backButton = UIButton().then {
        $0.setImage(.backImage, for: .normal)
    }
    private let bellButton = UIButton().then {
        $0.setImage(.bellImage, for: .normal)
    }
    private let gearButton = UIButton().then {
        $0.setImage(.gearImage, for: .normal)
    }
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func setStyle() {
        super.setStyle()
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = backButton
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarGearButton = UIBarButtonItem()
        rightBarGearButton.customView = gearButton
        let rightBarBellButton = UIBarButtonItem()
        rightBarBellButton.customView = bellButton
        navigationItem.rightBarButtonItems = [rightBarGearButton, rightBarBellButton]
    }
    override func setLayout() {
        super.setLayout()
        
    }
    
    // MARK: - ACTIONS
}
// MARK: - EXTENSIONs
extension MyPageViewController {
    
}

