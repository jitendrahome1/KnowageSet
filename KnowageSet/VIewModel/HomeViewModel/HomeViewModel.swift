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
    
   
    var numberOfSection: Int {
        get {
            return 2
        }
    }
    func heightForHeader(section:Int)->Int {
        switch section {
        case 0:
            return 0
        default:
            return 30
        }
    }

    func numberOfRowInSection(section:Int)->Int {
        switch section {
        case 0,1:
            return 1
        default:
            return 0
        }
        
    }
    func heightForRow(section:Int)->Int {
        switch section {
        case 0:
            return 202
        case 1:
            return 100
            
        default:
            return 0
        }
    }
}
