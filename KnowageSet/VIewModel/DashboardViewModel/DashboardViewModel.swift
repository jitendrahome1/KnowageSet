//
//  DashboardModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

struct tabBarUtility {
    
    var title:String
    var image: UIImage
    
    init(title:String, image: UIImage) {
        
        self.title =  title
        self.image =  image
        }
    
}

class DashboardViewModel {

    private let arrController:[UIViewController]
    

    init() {
      self.arrController = [HomeVC(), SkillsListVC(), MyCoursesVC(), WishlistVC(), AccountVC()]
        
        
    }

    var getController: [UIViewController] {
        
        get {
            
            return self.arrController
        }
    }
    
    func loadTabbarController() {
        print(getController.count)
    }

    private func loadViewController() {
    
       
        
        
        
    }
    
    
}
