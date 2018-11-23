//
//  Loader.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
import RSLoadingView

class Loader {
   static let share = Loader()
    private init() {}
    
    func showLoader() {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.showOnKeyWindow()
    
    }
    func hideLoader() {
          DispatchQueue.main.async {
           RSLoadingView.hideFromKeyWindow()
        }
 
    }
    
    
}

