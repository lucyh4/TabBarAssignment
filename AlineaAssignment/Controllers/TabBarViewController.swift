//
//  TabBarViewController.swift
//  AlineaAssignment
//
//  Created by Neha on 25/09/20.
//  Copyright © 2020 Neha. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    fileprivate func setupUI(){
        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white

     self.tabBar.isTranslucent = false
        setTabBarController()
    }
    fileprivate func setTabBarController() {
        let homeNavController = UINavigationController(rootViewController: HomeTabViewController())
        let searchNavController = UINavigationController(rootViewController: ExploreTabViewController())
        let contactsNavController = UINavigationController(rootViewController: ContactsTabViewController())
        homeNavController.tabBarItem = UITabBarItem(title: Strings.home, image: .home, tag: 0)
        searchNavController.tabBarItem = UITabBarItem(title: Strings.explore, image: .search, tag: 1)
        contactsNavController.tabBarItem = UITabBarItem(title: Strings.users, image: .users, tag: 2)
        
        self.setViewControllers([homeNavController, searchNavController, contactsNavController], animated: true)
        
        
    }
    
}
