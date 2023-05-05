//
//  TabBarController.swift
//  Sopt_changhwi
//
//  Created by 류창휘 on 2023/05/02.
//

import UIKit

class TabBarController : UITabBarController {
    let mainTab = UINavigationController(rootViewController: MainViewController())
    
    let mainTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTab.tabBarItem = mainTabBarItem
        
        viewControllers = [mainTab]
        
        ///탭바가 반투명 상태 bool
        tabBar.isTranslucent = false
        tabBar.barTintColor = .color000000
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        appearance.backgroundColor = .color000000
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
//        tabBar.unselectedItemTintColor = .lightGray
        tabBar.tintColor = .colorFFFFFF
        
        UITabBar.appearance().standardAppearance = appearance
    }
}
