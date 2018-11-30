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
    private let headerTitle:[String] = ["","","Categories","Top courses in Design","Top courses in Business","Top courses in Development" ,"Top courses in IT & Software" ,"Top courses in Personal Development"]
 
    var numberOfSection: Int {
        get {
            return 8
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
        case 0,1,2,3,4,5,6,7:
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
            return 90
        case 3,5:
            return 145
        case 4,6:
            return 180
        case 7:
            return 145
        
       
        default:
            return 0
        }
    }
    
    var getAllTags: [String] {
        get {
            return self.arrTagsItems
        }
    }
    func sectionTitle(index:Int)-> String {
        return self.headerTitle[index]
        
    }
    
}
