//
//  NavigationHelper.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
class NavigationHelper: NSObject {
    
    static let helper = NavigationHelper()
    var navController: UINavigationController!
    //Initializer access level change now
    fileprivate override init() {
    }
    
    internal func navigateToViewController(_ isSpeciality: Bool, index: Int) {
        navController.popViewController(animated: true)
    }
    
    
}
