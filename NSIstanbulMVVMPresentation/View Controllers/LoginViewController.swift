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

        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.email)
            .disposed(by: bag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.password)
            .disposed(by: bag)
        
        viewModel.isLoginButtonEnabled.asObservable()
            .bind(to: loginButton.rx.isEnabled)
            .disposed(by: bag)
        
    }
    
}


