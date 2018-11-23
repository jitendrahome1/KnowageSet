//
//  QueryService.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation


class QueryService {

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    func requestOTPAuthentication(mNumber mobileNumber:String, requestFor:OTPAuthenticationCategory, success:@escaping (_ response:OTPFeed)->()) {
        if requestFor.rawValue == OTPAuthenticationCategory.requestOTP.rawValue {
            if var urlComponents = URLComponents(string:OTPFeed.getOTP(mobileNumber: mobileNumber)) {
                
                guard let url = urlComponents.url else { return }
                
                dataTask = defaultSession.dataTask(with:url) { data, response, error in
                    defer { self.dataTask = nil }
                    
                    guard let data =  data else{return}
                    
                    do {
                       let json =  try JSONDecoder().decode(OTPFeed.self, from: data)
                        success(json)
                    }
                    catch {
                        print(error)
                    }
                    
                    
                }
                dataTask?.resume()
                
                
            }
            
        }
    }
    func requestOTPAuthenticationVerify(sessionID:String, requestFor:OTPAuthenticationCategory) {
        if requestFor.rawValue == OTPAuthenticationCategory.requestVerifyOTP.rawValue {
            
        }
        
    }
    
    
}
