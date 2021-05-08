//
//  LoginViewController.swift
//  Drop
//
//  Created by Urmat on 2/20/21.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var phoneNumberTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    // START: Variables for underline text
    var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19.0),
        NSAttributedString.Key.foregroundColor : UIColor.red,
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
    
    var forgetAttributedString = NSMutableAttributedString(string:"")
    var registerAttributedString = NSMutableAttributedString(string:"")
    
    // END: Variables for underline text

    override func viewDidLoad() {
      super.viewDidLoad()

        // Underline text for buttons
        self.underlineText()
    }
    
    func underlineText() {
        let forgetButtonTitleStr = NSMutableAttributedString(string:"Забыли пароль?", attributes:attrs)
        let registerButtonTitleStr = NSMutableAttributedString(string:"Нет аккаунта? Зарегистрироваться", attributes:attrs)
        forgetAttributedString.append(forgetButtonTitleStr)
        registerAttributedString.append(registerButtonTitleStr)
        forgetPasswordBtn.setAttributedTitle(forgetAttributedString, for: .normal)
        registerBtn.setAttributedTitle(registerAttributedString, for: .normal)
    }
    
    @IBAction func onClickLoginBtn(_ sender: Any) {
        
    }
    
    @IBAction func onClickRegisterBtn(_ sender: Any) {
        
    }
    
    @IBAction func onClickForgetPasswordBtn(_ sender: Any) {
        
    }
}
