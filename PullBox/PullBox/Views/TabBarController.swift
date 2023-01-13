//
//  TabBarController.swift
//  PullBox
//
//  Created by mingmac on 2023/01/06.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    lazy var mainViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: MainViewController())
        vc.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
        return vc
    }()
    
    lazy var registraionViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: RegistraionViewController())
        vc.tabBarItem = UITabBarItem(title: "등록", image: UIImage(systemName: "keyboard"), tag: 1)
        return vc
    }()
    
    lazy var newsViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: NewsViewController())
        vc.tabBarItem = UITabBarItem(title: "소식", image: UIImage(systemName: "newspaper"), tag: 2)
        return vc
    }()
    
    lazy var myProfileViewController: UIViewController = {
        let vc = UINavigationController(rootViewController: MyProfileViewController())
        vc.tabBarItem = UITabBarItem(title: "내 프로필", image: UIImage(systemName: "person"), tag: 3)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [mainViewController, registraionViewController, newsViewController, myProfileViewController]
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemBackground
    }
}
