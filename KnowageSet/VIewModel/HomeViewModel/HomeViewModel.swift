//
//  HomeViewModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 28/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel {
    
    private let arrTagsItems: [String] = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
                                           "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
                                            "on", "constraints", "placed", "on", "those", "views"]
 
    var numberOfSection: Int {
        get {
            return 3
        }
    }
    func heightForHeader(section:Int)->Int {
        switch section {
        case 0,1:
            return 0
        default:
            return 30
        }
    }

    func numberOfRowInSection(section:Int)->Int {
        switch section {
        case 0,1,2:
            return 1
        default:
            return 0
        }
        
    }
    func heightForRow(section:Int)->Int {
        switch section {
        case 0:
            return 202
        case 1,2:
            return 100
        
            
        default:
            return 0
        }
    }
    
    var getAllTags: [String] {
        get {
            return self.arrTagsItems
        }
    }
    
}
