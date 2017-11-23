//
//  LoginViewController.swift
//  NSIstanbulMVVMPresentation
//
//  Created by Tarık Taha Uygun on 23.11.2017.
//  Copyright © 2017 Tarık Taha Uygun. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var email: String?
    var password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        loginButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        print("email=\(email))")
        print("password=\(password)")
        print("isValidEmail=\(isValidEmail(email: email))")
        print("isValidPassword=\(isValidPassword(password: password))")
        
        if isValidEmail(email: email) && isValidPassword(password: password) {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }

        return true
    }
    
   
}
