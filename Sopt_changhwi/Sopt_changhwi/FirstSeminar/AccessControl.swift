//
//  AccessControl.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/04/06.
//

import UIKit

class TestVC : UIViewController {
    let testLabel = UILabel()
    
    let testLabel2 = UILabel()
    
    let testLabel3 = UILabel()
    
    let testButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        [testLabel, testLabel2, testLabel3, testButton].forEach({
//            view.addSubview($0)
//        })'
        for i in [testLabel, testLabel3, testLabel3, testButton] {
            view.addSubview(i)
        }
    }
    
    
    private func privateFunction() {
        
    }
}

class Test2VC : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let testVC = TestVC()
        //MARK: - private으로 인한 접근 제어
//        testVC.privateFunction()
        
    }
}
