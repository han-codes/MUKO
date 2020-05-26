//
//  BaseTabBarController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Initializer
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
        self.delegate = self
        
        let groupItem = UITabBarItem()
        groupItem.title = "Manage Groups"
        
        let studyItem = UITabBarItem()
        studyItem.title = "Study With Me"
        
        let settingsItem = UITabBarItem()
        settingsItem.title = "Settings"
        
        let manageGroupsVC = ManageGroupsViewController()
        manageGroupsVC.tabBarItem = groupItem
        
        let pomodoroViewController = PomodoroViewController()
        pomodoroViewController.tabBarItem = studyItem
        
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem = settingsItem
        
        viewControllers = [
            manageGroupsVC,
            pomodoroViewController,
            settingsViewController
        ]
        
        tabBar.backgroundColor = .lightGray
        tabBar.tintColor = .blue
        
        selectedIndex = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
