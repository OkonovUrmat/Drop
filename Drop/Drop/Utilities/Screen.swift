//
//  Screen.swift
//  Drop
//
//  Created by Urmat on 5/13/21.
//

import UIKit

class Screen {
    static let bounds = UIScreen.main.bounds
    static let height = bounds.height
    
    static let width: CGFloat = {
        let width = bounds.width
        if UIDevice().userInterfaceIdiom == .pad {
            
        }
        return width
    }()
    
    static var SideMenuWidth = CGFloat(0.0) // used only for iPad

    static var isPlusScreenDevice: Bool {
        var result: Bool = false
        if UIDevice().userInterfaceIdiom == .phone {
            if Screen.height > 700 {
                result = true
            }
        }
        return result
    }
    
    static var isSmallDevice: Bool {
        return (UIScreen.main.nativeBounds.height <= 1136)
    }
    
    static var isIpadDevice: Bool {
        return (UIDevice.current.userInterfaceIdiom == .pad)
    }
    
    static var isiPhoneXDevice: Bool {
        return UIScreen.main.bounds.height >= 812
    }
}

// override print
func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        Swift.print(items, separator:separator, terminator: terminator)
    #endif
}

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem as Any, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}

enum AttributeXY : Int {
    case none       = 0
    case leading
    case trailing
    case top
    case bottom
    case width
    case height
    case centerX
    case centerY
}

enum AttributeThan : Int {
    case none       = 0
    case width
    case height
}


extension UIView {
    // common function
    // * lessThan, moreThan
    func setupLayoutThanOrEqual(_ isGreater: Bool = true, attribute attr1: AttributeThan, toItem parent: UIView, attribute attr2: AttributeThan, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        // switch
        switch attr1 {
        case .width:
            if attr2 == .none {
                if isGreater {
                    self.widthAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
                } else {
                    self.widthAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
                }
            } else if attr2 == .width {
                if isGreater {
                    self.widthAnchor.constraint(greaterThanOrEqualTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                } else {
                    self.widthAnchor.constraint(lessThanOrEqualTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                }
            } else if attr2 == .height {
                if isGreater {
                    self.widthAnchor.constraint(greaterThanOrEqualTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
                } else {
                    self.widthAnchor.constraint(lessThanOrEqualTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
                }
            } else {
                fatalError("Constraint [width] is set incorrectly")
            }
        case .height:
            if attr2 == .none {
                if isGreater {
                    self.heightAnchor.constraint(greaterThanOrEqualToConstant: constant).isActive = true
                } else {
                    self.heightAnchor.constraint(lessThanOrEqualToConstant: constant).isActive = true
                }
            } else if attr2 == .width {
                if isGreater {
                    self.heightAnchor.constraint(greaterThanOrEqualTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                } else {
                    self.heightAnchor.constraint(lessThanOrEqualTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
                }
            } else if attr2 == .height {
                if isGreater {
                    self.heightAnchor.constraint(greaterThanOrEqualTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
                } else {
                    self.heightAnchor.constraint(lessThanOrEqualTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
                }
            } else {
                fatalError("Constraint [height] is set incorrectly")
            }
        case .none:
            // nothi
            fatalError("First constraint cannot be none")
        }
    }
    // * equal
    func setupLayout(attribute attr1: AttributeXY, toItem parent: UIView, attribute attr2: AttributeXY, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        // switch
        switch attr1 {
        case .leading:
            if attr2 == .leading {
                self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
            } else if attr2 == .trailing {
                self.leadingAnchor.constraint(equalTo: parent.trailingAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [leading] is set incorrectly")
            }
        case .trailing:
            if attr2 == .leading {
                self.trailingAnchor.constraint(equalTo: parent.leadingAnchor, constant: constant).isActive = true
            } else if attr2 == .trailing {
                self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [trailing] is set incorrectly")
            }
        case .top:
            if attr2 == .top {
                self.topAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
            } else if attr2 == .bottom {
                self.topAnchor.constraint(equalTo: parent.bottomAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [top] is set incorrectly")
            }
        case .bottom:
            if attr2 == .top {
                self.bottomAnchor.constraint(equalTo: parent.topAnchor, constant: constant).isActive = true
            } else if attr2 == .bottom {
                self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [bottom] is set incorrectly")
            }
        case .width:
            if attr2 == .none {
                self.widthAnchor.constraint(equalToConstant: constant).isActive = true
            } else if attr2 == .width {
                self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
            } else if attr2 == .height {
                self.widthAnchor.constraint(equalTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
            } else {
                fatalError("Constraint [width] is set incorrectly")
            }
        case .height:
            if attr2 == .none {
                self.heightAnchor.constraint(equalToConstant: constant).isActive = true
            } else if attr2 == .width {
                self.heightAnchor.constraint(equalTo: parent.widthAnchor, multiplier: multiplier, constant: constant).isActive = true
            } else if attr2 == .height {
                self.heightAnchor.constraint(equalTo: parent.heightAnchor, multiplier: multiplier, constant: constant).isActive = true
            } else {
                fatalError("Constraint [height] is set incorrectly")
            }
        case .centerX:
            if attr2 == .centerX {
                self.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [centerX] is set incorrectly")
            }
        case .centerY:
            if attr2 == .centerY {
                self.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: constant).isActive = true
            } else {
                fatalError("Constraint [centerY] is set incorrectly")
            }
        case .none:
            // nothi
            fatalError("First constraint cannot be none")
        }
    }
}

extension UILabel {
    func setAttributedText(with string: String) {
        let attributedString = NSMutableAttributedString(string: string)
        
        // *** Create instance of `NSMutableParagraphStyle`
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 5 // Whatever line spacing you want in points
        
        // *** Apply attribute to string ***
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        // *** Set Attributed String to your label ***
        attributedText = attributedString
    }
    
    func countLabelLines() -> Int {
        // Call self.layoutIfNeeded() if your view is uses auto layout
        let myText = (self.text ?? "") as NSString
        let attributes = [NSAttributedString.Key.font : self.font as Any]
        
        let labelSize = myText.boundingRect(with: CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
    
    func isTruncated() -> Bool {
        
        if (self.countLabelLines() > self.numberOfLines) {
            return true
        }
        return false
    }
    func getLinesArrayFromLabel() -> [String] {
        
        let text:NSString = (self.text ?? "") as NSString // TODO: Make safe?
        let font:UIFont = self.font
        let rect:CGRect = self.frame
        
        let myFont:CTFont = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
        let attStr:NSMutableAttributedString = NSMutableAttributedString(string: text as String)
        attStr.addAttribute(NSAttributedString.Key(rawValue: String(kCTFontAttributeName)), value:myFont, range: NSMakeRange(0, attStr.length))
        let frameSetter:CTFramesetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
        let path:CGMutablePath = CGMutablePath()
        path.addRect(CGRect(x:0, y:0, width:rect.size.width, height:100000))
        
        let frame:CTFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
        let lines = CTFrameGetLines(frame) as NSArray
        var linesArray = [String]()
        
        for line in lines {
            let lineRange = CTLineGetStringRange(line as! CTLine)
            let range:NSRange = NSMakeRange(lineRange.location, lineRange.length)
            let lineString = text.substring(with: range)
            linesArray.append(lineString as String)
        }
        return linesArray
    }
}

extension UIImage {
    func resizeImage(_ targetSize: CGSize) -> UIImage? {
        let size = self.size
        
        let widthRatio  = targetSize.width  / self.size.width
        let heightRatio = targetSize.height / self.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0 /*not loosing quality*/)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension String {
    func removeDublicatesFromQuery() -> String {
        let array = self.split(separator: "&")
        var newArray = [Substring]()
        for element in array {
            if !newArray.contains(element) {
                newArray.append(element)
            }
        }
        return newArray.joined(separator: "&")
    }
    
    func stringByRemovingEmoji() -> String {
        return String(self.filter { !$0.isEmoji() })
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

extension Character {
    // all emoji scalars https://forums.developer.apple.com/thread/110059
    func isEmoji() -> Bool {
        return
            Character(UnicodeScalar(UInt32(0x1F600))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F64F))!) // Emoticons
                || Character(UnicodeScalar(UInt32(0x1F300))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F5FF))!) // Misc Symbols and Pictographs
                || Character(UnicodeScalar(UInt32(0x1F680))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F6FF))!) // Transport and Map
                || Character(UnicodeScalar(UInt32(0x1F1E6))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F1FF))!) // Regional country flags
                || Character(UnicodeScalar(UInt32(0x2600))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26FF))!)   // Misc symbols 9728 - 9983
                || Character(UnicodeScalar(UInt32(0x2700))!) <= self && self <= Character(UnicodeScalar(UInt32(0x27BF))!)   // Dingbats
                || Character(UnicodeScalar(UInt32(0xFE00))!) <= self && self <= Character(UnicodeScalar(UInt32(0xFE0F))!)   // Variation Selectors
                || Character(UnicodeScalar(UInt32(0x1F900))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F9FF))!) // Supplemental Symbols and Pictographs 129280 - 129535
                || Character(UnicodeScalar(UInt32(0x1F018))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1F270))!) // Various asian characters 127000...127600
                || Character(UnicodeScalar(UInt32(65024))!) <= self && self <= Character(UnicodeScalar(UInt32(65039))!)     // Variation selector
                || Character(UnicodeScalar(UInt32(9100))!) <= self && self <= Character(UnicodeScalar(UInt32(9300))!)       // Misc items
                || Character(UnicodeScalar(UInt32(8400))!) <= self && self <= Character(UnicodeScalar(UInt32(8447))!)       // Combining Diacritical Marks for Symbols
    }
}

extension UIApplication {
    class func openAppSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

/**
 * String? returns String or ""
 */
extension Swift.Optional where Wrapped == String {
    func orEmpty() -> String {
        return self ?? ""
    }
}
