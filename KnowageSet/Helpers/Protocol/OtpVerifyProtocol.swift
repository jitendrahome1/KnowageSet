//
//  OtpVerifyProtocol.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 21/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import SendOTPFramework

protocol OTPVerifyProtocol {
    func didOTPVerify()
    }

extension OTPVerifyProtocol where Self: LoginVC {

    func didOTPVerify() {
        let frameworkBundle = Bundle(identifier: "com.walkover.SendOTPFramework")
        let authViewControler :AuthenticationViewController = AuthenticationViewController.init(nibName: "AuthenticationViewController", bundle: frameworkBundle)
        authViewControler.delegate = self
        authViewControler.navBarColor = UIColor.blue
        
        // set navbar title color
        authViewControler.navBarTitleColor = UIColor.white
        
        //Set your auth key here
        authViewControler.authkey = "248419AJwPYSXVSrF5bf54d44"
        
        // set company logo
        //  authViewControler.companyImage = #imageLiteral(resourceName: "defaultLogo.png")
        
        // set custom message here with ##OTP##
        authViewControler.customMessage = "Your verification code is ##OTP##."
        
        // set the sender id here
        authViewControler.senderId = "OTPSMS"
        
        // set access type here
        authViewControler.accessTypeShouldBeHTTP = false // sets https by default
        
        self.present(authViewControler, animated: true, completion: nil)
    }
   
 
    
}
extension LoginVC:SendOTPAuthenticationViewControllerDelegate {
    func authenticationisSuccessful(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Success")
    }
    func authenticationisFailed(forMobileNumber mobNo: String!, withCountryCode countryCode: String!) {
        print(mobNo)
        print("Failure")
    }
    func canceledAuthentication() {
        print("Failure")
    }
}
