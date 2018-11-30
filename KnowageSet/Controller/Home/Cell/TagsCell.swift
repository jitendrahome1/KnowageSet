//
//  TagsCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 28/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import TTGTagCollectionView
class TagsCell: BaseTableViewCell {

    @IBOutlet var tagView: TTGTextTagCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
          tagView.scrollDirection = .horizontal
          tagView.alignment = .fillByExpandingWidth
          tagView.numberOfLines = 2
            self.backgroundColor = .clear
        
    }
    
    override var datasource: AnyObject? {
        didSet {
            
            guard datasource != nil else {
                return
            }
            
            self.tagView.addTags(datasource as? [String])
            
        }
    }
    
}

