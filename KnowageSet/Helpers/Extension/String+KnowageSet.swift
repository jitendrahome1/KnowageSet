//
//  String+KnowageSet.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
extension  String {
    func convertToClass<T>() -> T.Type? {
        return StringClassConverter<T>.convert(string: self)
    }
    
    class StringClassConverter<T> {
        
        static func convert(string className: String) -> T.Type? {
            guard let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
                return nil
            }
            guard let aClass: T.Type = NSClassFromString("\(nameSpace).\(className)") as? T.Type else {
                return nil
            }
            return aClass
            
        }
        
    }
    
}


