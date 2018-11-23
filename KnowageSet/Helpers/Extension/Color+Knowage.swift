//
//  Color+Knowage.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    static func returnRGBColor(r:CGFloat, g:CGFloat, b:CGFloat, alpha:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
