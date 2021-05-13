//
//  Navigation.swift
//  Drop
//
//  Created by Urmat on 5/13/21.
//

import UIKit

class Navigation {
    static func configure (_ navigationController: UINavigationController) {
        Navigation.navigationController = navigationController
    }

    static func start<T: BaseViewController>(_ viewController: T, _ showBackButton: Bool = true, _ animated: Bool = true) {
        if showBackButton {
            if let image = UIImage(named: "btn_back") {
                let btnHeight = CGFloat(21)
                let im_width = image.size.width
                let im_height = image.size.height
                let im_scale = im_width / im_height
                // minimize length of Item max of 1/3 of Screen.width
                var size = CGSize(width: UIScreen.main.bounds.width / 3.0, height: 0) // height to be defined later
                if im_scale * btnHeight < size.width {
                    size = CGSize(width: im_scale * btnHeight, height: btnHeight)
                } else {
                    size.height = size.width / im_scale
                }
                // custom view as UIButton for Item
                if let image2 = image.resizeImage(size) {
                    let button = UIButton(frame: CGRect(origin: CGPoint(x: -10, y: 0), size: size))
                    button.setBackgroundImage(image2, for: .normal)
                    button.addTarget(self, action: #selector(back_), for: .touchUpInside)
                    let backButton = UIBarButtonItem(customView: button)
                    viewController.navigationItem.setLeftBarButton(backButton, animated: true)
                    viewController.parent?.navigationItem.setLeftBarButton(backButton, animated: true)
                }
            }
        } else {
            viewController.navigationItem.setHidesBackButton(true, animated: false)
        }
        
        navigationController?.pushViewController(viewController, animated: animated)
    }

    @objc static func back_() {
        Navigation.navigationController?.popViewController(animated: true)
    }

    static func back(_ animated: Bool = true, _ completion: (() -> ())? = nil) {
        navigationController?.popViewController(animated: animated)
        if let completion = completion {
            completion()
        }
    }
    
    static func dropLast () {
        if navigationController.viewControllers.indices.contains((navigationController.viewControllers.endIndex - 1) - 1) {
            navigationController.viewControllers.remove(at: ((navigationController.viewControllers.endIndex - 1) - 1));
        }
    }
    
    static func dropBeforeLast () {
        if navigationController.viewControllers.indices.contains(navigationController.viewControllers.endIndex - 1) {
            navigationController.viewControllers.remove(at: (navigationController.viewControllers.endIndex - 1));
        }
    }

    static func pop() {
        navigationController.viewControllers.removeLast()
    }
    
    static func removeAll() {
        navigationController.viewControllers.removeAll()
    }
    
    static func getPreviousController() -> UIViewController? {
        let count = navigationController.viewControllers.count
        if count > 1 {
            return navigationController.viewControllers[count - 2]
        } else {
            return nil
        }
    }

    /*private*/ static var navigationController: UINavigationController!
}
