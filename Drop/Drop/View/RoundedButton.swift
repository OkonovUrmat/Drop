//
//  RoundedButton.swift
//  Drop
//
//  Created by Urmat on 2/7/21.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.height / 5
        self.clipsToBounds = true
    }
    
}

