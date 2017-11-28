//
//  LoginViewModel.swift
//  NSIstanbulMVVMPresentation
//
//  Created by Tarık Taha Uygun on 23.11.2017.
//  Copyright © 2017 Tarık Taha Uygun. All rights reserved.
//

import Foundation

protocol LoginViewModelDelegate {
    func notifyController()
}

class LoginViewModel {
    
    var email: String = "" {
        didSet {
            handleLoginButtonEnabledState()
        }
    }
    var password: String = "" {
        didSet {
            handleLoginButtonEnabledState()
        }
    }
    
    var delegate: LoginViewModelDelegate?
    
    var isLoginButtonEnabled: Bool = false {
        didSet {
            self.delegate?.notifyController()
        }
    }
    
    func handleLoginButtonEnabledState(){
        isLoginButtonEnabled = isValidEmail(email: email) && isValidPassword(password: password)
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func isValidPassword(password: String) -> Bool {
        if password.count < 8 {
            return false
        }
        return true
    }
    
}

