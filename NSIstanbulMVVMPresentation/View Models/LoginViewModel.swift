//
//  LoginViewModel.swift
//  NSIstanbulMVVMPresentation
//
//  Created by Tarık Taha Uygun on 23.11.2017.
//  Copyright © 2017 Tarık Taha Uygun. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    
    let email = Variable<String>("")
    let password = Variable<String>("")
    let isLoginButtonEnabled = Variable<Bool>(false)
    
    init() {
        _ = email.asObservable()
        _ = password.asObservable()
        _ = isLoginButtonEnabled.asObservable()
            .subscribe(onNext: { value in
                
            })
        

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
