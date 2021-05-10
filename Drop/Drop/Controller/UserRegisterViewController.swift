//
//  UserRegisterViewController.swift
//  Drop
//
//  Created by Urmat on 2/7/21.
//

import UIKit

class UserRegisterViewController: BaseViewController {

    @IBOutlet weak var nameLbl: RoundedTextField!
    @IBOutlet weak var phoneNumberLbl: RoundedTextField!
    @IBOutlet weak var passwordLbl: RoundedTextField!
    @IBOutlet weak var logInBtn: UIButton!
    
    // START: Variables for underline text
    var attrs = [
        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 19.0),
        NSAttributedString.Key.foregroundColor : UIColor.red,
        NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
    
    var logInAttributedString = NSMutableAttributedString(string:"")
    
    // END: Variables for underline text

    override func viewDidLoad() {
      super.viewDidLoad()

        // Underline text for buttons
        self.underlineText()
    }
    
    func underlineText() {
        let logInButtonTitleStr = NSMutableAttributedString(string:"Уже есть аккаунт? Войти", attributes:attrs)
        logInAttributedString.append(logInButtonTitleStr)
        logInBtn.setAttributedTitle(logInButtonTitleStr, for: .normal)
    }
    
    @IBAction func onClickRegistrationBtn(_ sender: Any) {
        
    }
    
    @IBAction func onClickRuleBtn(_ sender: Any) {
        
    }
}
