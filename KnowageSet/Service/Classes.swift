//
//  APICall.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import SwiftyJSON

class APICall {
    static let share = APICall()
    let queryService = QueryService()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    private init(){}

   // sent OPT
    
    func requestOTPAuthentication(mobileNumber:String, success:@escaping (_ success:OTPFeed)->()) {
            Loader.share.showLoader()
            if var urlComponents = URLComponents(string:OTPFeed.getOTP(mobileNumber: mobileNumber)) {
             
                guard let url = urlComponents.url else { return }
                dataTask = defaultSession.dataTask(with:url) { data, response, error in
                    defer {
                         Loader.share.hideLoader()
                        self.dataTask = nil

                    }
                    guard let data =  data else{return}
                    do {
                        let json =  try JSONDecoder().decode(OTPFeed.self, from: data)

                            Loader.share.hideLoader()
                            success(json)
                    }
                    catch {
                        Loader.share.hideLoader()
                        print(error)
                    }
                }
                dataTask?.resume()
            }
    }
   
    
    
    func requestOTPAuthenticationVerify(otp:String,sessionID:String, requestFor:OTPAuthenticationCategory,success:@escaping (_ success:OTPFeed)->()) {
        if var urlComponents = URLComponents(string:OTPFeed.varifyOTP(sessionID: sessionID, OTP: otp)) {
            guard let url = urlComponents.url else { return }
            dataTask = defaultSession.dataTask(with:url) { data, response, error in
                defer {
                   
                    self.dataTask = nil
                    
                }
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
