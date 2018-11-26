//
//  UIStoryboard+KnowageSet.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
enum AppStoryboard: String {
    case main = "Main"
    case dashboard = "Dashboard"
}
extension UIStoryboard {
    
    func instantiate<T>(identifier: String, asClass: T.Type) -> T {
       
        return instantiateViewController(withIdentifier: identifier) as! T
    }
    
    func instantiate<T>(identifier: String) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
