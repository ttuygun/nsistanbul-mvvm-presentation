//
//  LoginViewModel.swift
//  NSIstanbulMVVMPresentation
//
//  Created by Tarık Taha Uygun on 23.11.2017.
//  Copyright © 2017 Tarık Taha Uygun. All rights reserved.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    let email = Variable<String>("")
    let password = Variable("")
    let isLoginButtonEnabled = Variable<Bool>(false)
    let bag = DisposeBag()
    
    init() {
        email.asObservable()
            .subscribe(onNext: { value in
                self.handleLoginButtonEnabledState()
            }).disposed(by: bag)
        
        password.asObservable()
            .subscribe(onNext: { value in
                self.handleLoginButtonEnabledState()
            }).disposed(by: bag)
    }
    
    func handleLoginButtonEnabledState(){
        isLoginButtonEnabled.value = isValidEmail(email: email.value) && isValidPassword(password: password.value)
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
