//
//  UIViewController+KnowageSet.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import  UIKit


extension UIViewController {
    
    class func instantiate<T: UIViewController>(appStoryboard: AppStoryboard) -> T {
        
        let storyboard = UIStoryboard(name: appStoryboard.rawValue, bundle: nil)
        let identifier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}
