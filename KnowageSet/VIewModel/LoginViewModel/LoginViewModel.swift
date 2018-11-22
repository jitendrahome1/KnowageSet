//
//  LoginViewModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewModelDelagte {
    
    func getSuccessOTP(isSuccess:Bool)
    func verfiyOTP(isSuccess:Bool)
}
class LoginViewModel:NSObject {
    var delegate: LoginViewModelDelagte!
    let obj: OTPDetails
    override init() {
        self.obj = OTPDetails()
    }
    func getOTP(mNumber:String){
        
        APICall.share.requestOTPAuthentication(mobileNumber: mNumber) { (response) in
            let feedData:String =  (response.Status! == "Success") ?  response.Details! : ""
            if !(feedData.isEmpty) {
                self.delegate.getSuccessOTP(isSuccess: true)
               }
            
        }
       
    }
    func verifyOTP(otp:String) {
        
        print(obj.Details)
        APICall.share.requestOTPAuthenticationVerify(otp: otp, sessionID: obj.Details!, requestFor: .requestVerifyOTP) { (response) in
            let feedData:String =  (response.Status! == "Success") ?  response.Details! : ""
            if !(feedData.isEmpty) {
                self.delegate.verfiyOTP(isSuccess: true)
            }
        }
        
    }
    
}
