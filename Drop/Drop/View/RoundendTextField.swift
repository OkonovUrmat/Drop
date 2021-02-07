//
//  RoundendTextView.swift
//  Drop
//
//  Created by Urmat on 2/7/21.
//

import UIKit

@IBDesignable
class RoundedTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = cornerRadius
    }
    
}
