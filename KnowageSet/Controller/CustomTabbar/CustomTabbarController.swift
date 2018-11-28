//
//  CustomTabbar.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
private struct TabBarUtility {
    
    var title:String
    var image: UIImage
    var controller:UIViewController
    
    init(title:String, image: UIImage, controller:UIViewController) {
        self.title       =  title
        self.image       =  image
        self.controller  = controller
    }
    
}
class CustomTabbarController : UITabBarController {
    
    private var arrController:[UIViewController.Type] = []
    private var arrTabbarTitle:[String]    = []
    private var arrTabbarImage:[UIImage]   = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor =  .white
        self.arrTabbarTitle = ["Home","Skills List","Wishlist","My Courses","Account"]
        self.arrTabbarImage = [ #imageLiteral(resourceName: "home"),#imageLiteral(resourceName: "skills"),#imageLiteral(resourceName: "mycources"),#imageLiteral(resourceName: "wishlist"),#imageLiteral(resourceName: "account")]
        self.arrController = [HomeVC.self, SkillsListVC.self, MyCoursesVC.self, WishlistVC.self, AccountVC.self] // view controller and identifiers both should same
        self.loadTabbarViewController()
        
    }
   private func loadTabbarViewController() {
        var navigationController:UINavigationController!
        var tempController:[UIViewController] = []
        for (idx,_) in arrController.enumerated() {
            let cont = dashboardStoryboard.instantiate(identifier: String(describing: arrController[idx]), asClass:arrController[idx])
            let utiltiy =  TabBarUtility(title: arrTabbarTitle[idx], image: arrTabbarImage[idx], controller:cont)
            let vc = utiltiy.controller
            navigationController = UINavigationController(rootViewController: vc)
            navigationController.title = utiltiy.title
            navigationController.tabBarItem.image = utiltiy.image
            tempController.append(navigationController)
            }
           // NavigationHelper.helper.navController = navigationController
            viewControllers = tempController
    
        
    }
  
}

