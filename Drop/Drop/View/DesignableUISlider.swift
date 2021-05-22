//
//  DesignableUISlider.swift
//  Drop
//
//  Created by Urmat on 5/22/21.
//

import UIKit

class DesignableUISlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = 30
        return newBounds
    }
}
