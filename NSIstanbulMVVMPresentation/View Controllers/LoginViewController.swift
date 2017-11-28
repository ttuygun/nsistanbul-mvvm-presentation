//
//  LoginViewController.swift
//  NSIstanbulMVVMPresentation
//
//  Created by Tarık Taha Uygun on 23.11.2017.
//  Copyright © 2017 Tarık Taha Uygun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = LoginViewModel()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: bag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: bag)

        
        _ = viewModel.isLoginButtonEnabled.asObservable()
            .subscribe(onNext: {
                print($0)
            }).disposed(by: bag)
        
         _ = viewModel.isLoginButtonEnabled.asObservable()
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: bag)
        
//        _ = viewModel.isLoginButtonEnabled.asObservable()
//            .subscribe(onNext: {
//                 self.loginButton.isEnabled = $0
//            })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        print("email=\(email))")
        print("password=\(password)")
//        print("isValidEmail=\(isValidEmail(email: email))")
//        print("isValidPassword=\(isValidPassword(password: password))")
//        
//        if isValidEmail(email: email) && isValidPassword(password: password) {
//            loginButton.isEnabled = true
//        } else {
//            loginButton.isEnabled = false
//        }

        return true
    }
    
   
}
