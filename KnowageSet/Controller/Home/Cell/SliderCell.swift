//
//  SliderCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 27/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class SliderCell: BaseTableViewCell{

    @IBOutlet var pageControlView: JAPageControl!
  //  private let imagesData = ["image1.jpg", "image2.jpg", "image3.jpg", "image4.jpg", "image5.jpg", "image6.jpg"]
   
    override func awakeFromNib() {
        super.awakeFromNib()
       pageControlView.loadPager(imageItems: [UIImage(named: "image1.jpg")!,UIImage(named: "image2.jpg")!,UIImage(named: "image3.jpg")!,UIImage(named: "image4.jpg")!,UIImage(named: "image5.jpg")!])
        pageControlView.timerValue = 2.0
        pageControlView.isPageAutoScroll = true
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
