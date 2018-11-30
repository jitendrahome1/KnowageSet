//
//  SizeClass.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 30/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

struct CellSize {
    var width:CGFloat
    var height:CGFloat
    var rowEach:Int
    
    init() {
        self.width =  screenWidth
        self.height =  145.0
        self.rowEach =  3
        }
    init(width:CGFloat, height:CGFloat , rowEach:Int) {
        self.width =  width
        self.height =  height
        self.rowEach =  rowEach
        
    }
   
 
    var cellSpacing:Int {
        get {
            return 16
        }
    }
     var cellWidth:CGFloat {
        
        get{
            return (self.width / CGFloat(self.rowEach)) - CGFloat(self.cellSpacing)
        }
    }
     var cellHeight:CGFloat {
        
        get{
            return (self.height - CGFloat(self.cellSpacing))
        }
    }
    
    mutating func setCellSize(width:CGFloat, height:CGFloat , rowEach:Int) {
        self.width =  width
        self.height =  height
        self.rowEach =  rowEach
    }
}
