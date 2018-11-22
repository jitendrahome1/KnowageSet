//
//  LoginVC.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 21/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
import SendOTPFramework
class LoginVC: BaseViewController,OTPVerifyProtocol, LoginViewModelDelagte, UITextFieldDelegate {
    @IBOutlet weak var lblRegisterTitle: UILabel!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var viewMobileNumber: UIView!
    @IBOutlet weak var viewOtp: UIView!
    @IBOutlet weak var textOtp: UITextField!
    @IBOutlet weak var textMobileNumber: UITextField!
    @IBOutlet weak var heightConst: NSLayoutConstraint!
    @IBOutlet weak var underlineView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    private var model:LoginViewModel =  LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.delegate = self
        lblRegisterTitle.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        initialSetup()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewOtp.alpha = 0.0
        self.viewMobileNumber.alpha =  0.0
        showAnimation()
    }
    
    @IBAction func actionRegister(_ sender: UIButton) {
        didOTPVerify()
    }
  }
// Mark: - Add done buton in keybord
extension LoginVC {
    
    // Insitial setup
    fileprivate func initialSetup() {
        self.addDoneButtonOnKeyboard()
    }
    fileprivate func showAnimation() {
        UIView.animate(withDuration: 1.0, animations: {
            self.lblTitle.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: { (true) in
            self.underlineView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            self.viewMobileNumber.alpha = 1.0
        })
    }
    
    private func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        self.textMobileNumber.inputAccessoryView = doneToolbar
    }
    // MRAK:- ACTION
    @objc func doneButtonAction()
    {
        guard (self.textMobileNumber.hasText) && !((self.textMobileNumber.text?.count)! < 10)else {
            if ((self.textMobileNumber.text?.isEmpty)!) {
                showAlert(title:ALERT_TITLE, message: ALERT_BLANK_MOBILE)
                return
            }
            if (self.textMobileNumber.text?.count)! < 10 {
                showAlert(title:ALERT_TITLE, message: ALERT_LIMIT)
                return
            }
            return
        }
        self.model.getOTP(mNumber: self.textMobileNumber.text!)
    }
    
    
}
// MARK- LOGIN VIEW DELEGATE
extension LoginVC {
    func getSuccessOTP(isSuccess: Bool) {
        if (isSuccess) {
            DispatchQueue.main.async {
                self.viewOtp.alpha = 0.0
                self.textMobileNumber.isEnabled = false
                UIView.animate(withDuration: 0.5, animations: {
                    self.heightConst.constant = 96.0
                    self.viewOtp.alpha = 1.0
                    self.view.layoutIfNeeded()
                }, completion: { (true) in
                    self.textOtp.inputAccessoryView = nil
                    self.view.endEditing(true)
                })
            }
        }
    }
    func verfiyOTP(isSuccess: Bool) {
        print(isSuccess)
    }
    
}
// MARK:- TEXTField Delagte
extension LoginVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if (self.textOtp.text?.isEmpty)! {
            showAlert(title:ALERT_TITLE, message: ALERT_OTP)
        }else{
            self.model.verifyOTP(otp: self.textOtp.text!)
        }
        return true
    }
    
}

