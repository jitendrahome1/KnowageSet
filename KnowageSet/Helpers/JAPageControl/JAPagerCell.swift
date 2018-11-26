//
//  JAPagerCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class JAPagerCell: BaseCollectionViewCell {
    
    
    override var datasource: AnyObject? {
        didSet {
            
            guard let dataSource =  datasource else {
                return
            }
            //  do something.
            
        }
    }
    
}

