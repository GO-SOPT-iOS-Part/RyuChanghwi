//
//  BaseViewController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
      return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    // MARK: Initializing
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("DEINIT: \(className)")
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
        actions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: UI
    
    /// Attributes (속성) 설정 메서드
    func setStyle() {
        
        view.backgroundColor = .white
    }
    
    /// Hierarchy, Constraints (계층 및 제약조건) 설정 메서드
    func setLayout() {}
   
    /// 액성 함수
    func actions() {}
}


