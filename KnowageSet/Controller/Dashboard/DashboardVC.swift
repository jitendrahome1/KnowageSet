//
//  CustomTabbar.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
class DashboardVC: UITabBarController {
    
    private var model: DashboardViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        model =  DashboardViewModel()
        
        model.loadTabbarController()
        
        let feedController = HomeVC()
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "Home"
        navigationController.tabBarItem.image = UIImage(named: "news_feed_icon")
        
        let friendRequestController = UIViewController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestController)
        secondNavigationController.title = "Requests"
        secondNavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        
        let messengerVC = UIViewController()
        let messengerNavigationController = UINavigationController(rootViewController: messengerVC)
        messengerNavigationController.title = "Messenger"
        messengerNavigationController.tabBarItem.image = UIImage(named: "messenger_icon")
        
        let notificationsNavController = UINavigationController(rootViewController: UIViewController())
        notificationsNavController.title = "Notifications"
        notificationsNavController.tabBarItem.image = UIImage(named: "globe_icon")
        
        let moreNavController = UINavigationController(rootViewController: UIViewController())
        moreNavController.title = "More"
        moreNavController.tabBarItem.image = UIImage(named: "more_icon")
        
        viewControllers = [navigationController ,secondNavigationController, messengerNavigationController, notificationsNavController, moreNavController]
        tabBar.isTranslucent = false
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.returnRGBColor(r: 229, g: 231, b: 235, alpha: 1).cgColor
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true
        
    }
}
