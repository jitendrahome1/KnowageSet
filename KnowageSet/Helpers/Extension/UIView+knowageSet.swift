//
//  UIView+knowageSet.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 27/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    static func instantiateFromNib() -> Self? {
            
            func instanceFromNib<T: UIView>() -> T? {
                
                return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
            }
            
            return instanceFromNib()
        }
    
    
//    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
//        return UINib(
//            nibName: nibNamed,
//            bundle: bundle
//            ).instantiate(withOwner: nil, options: nil)[0] as? UIView
//    }
    
    
}

