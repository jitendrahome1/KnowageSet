//
//  CourceCollectionviewCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 29/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class CourceCollectionviewCell: BaseCollectionViewCell {
    
    @IBOutlet var viewBG: UIView!
    @IBOutlet var lblCoursePrice: UILabel!
    @IBOutlet var lblCourseTitle: UILabel!
    @IBOutlet var imgCourse: UIImageView!
    
    override var datasource: AnyObject? {
        didSet {
            if let _ =  datasource {
                
            }
        }
    }
    
    
    override func awakeFromNib() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 4.0
    }



}
