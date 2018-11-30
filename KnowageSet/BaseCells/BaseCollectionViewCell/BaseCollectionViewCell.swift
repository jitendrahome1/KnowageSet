//
//  BaseCollectionViewCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell,ReusableView , NibLoadableView{
 
    override func awakeFromNib() {
        self.backgroundColor = .clear
    }
    var datasource: AnyObject?
    
    
}
