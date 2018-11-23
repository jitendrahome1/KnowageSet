//
//  UIController.swift
//  JANavigation
//
//  Created by Jitendra Kumar Agarwal on 19/10/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
struct LabelTitleUI {
    
    var title:String
    var tittleColor: UIColor
    var font : UIFont
    
    init(_title:String, _titleColor:UIColor, _font:UIFont) {
        self.title          =   _title
        self.tittleColor    =   _titleColor
        self.font           =   _font
        
    }
    
}
struct Subtitle {
    
    var subTitle: LabelTitleUI?
    
    init(_subTitle:LabelTitleUI) {
        self.subTitle = _subTitle
    }

}

