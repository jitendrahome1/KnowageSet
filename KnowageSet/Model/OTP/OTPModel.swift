//
//  UserModel.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 22/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation


enum OTPAuthenticationCategory:Int {
    
    case requestOTP = 0
    case requestVerifyOTP
    func rowOutPut()-> Int {
        return self.rawValue
    }
}
struct OTPFeed:Decodable {
    
    var mobileNumber: String?
    var otpValue:String?
    var Details: String?
    var Status: String?
    
    enum codingKey:String, CodingKey{
        case details = "Details"
        case mobileNumber
        case otpValue
        case status = "Status"
    }

    
    static func getOTP(mobileNumber:String)-> String {
        return "https://2factor.in/API/V1/\(OTP2FACTORAPIKEY)/SMS/+91\(mobileNumber)/AUTOGEN-343434"
    }
    static func varifyOTP(sessionID:String,OTP:String)-> String {
        return  "https://2factor.in/API/V1/\(OTP2FACTORAPIKEY)/SMS/VERIFY/\(sessionID)/\(OTP)"
        
    }

}
