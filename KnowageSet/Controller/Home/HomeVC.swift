//
//  HomeVC.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController {

    //@IBOutlet var aView: JAPageControl!
    
    @IBOutlet var pagerView: JAPageControl!
    
    let imagesData = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
       self.view.backgroundColor = UIColor.blue
        
    
       // self.pagerView = JAPageControl(frame: CGRect(x: 100, y: 200, width: 100, height: 100),imageItems: [UIImage(named: "image1.jpg")!])
     //  aView =  JAPageControl(frame: CGRect(x: 100, y: 100, width: 100, height: 150))
     
        
    }
    
  
    
}
