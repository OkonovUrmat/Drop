//
//  OrderDetailViewController.swift
//  Drop
//
//  Created by Urmat on 5/5/21.
//

import UIKit

class OrderDetailViewController: BaseViewController {

    static func create () -> OrderDetailViewController {
        let orderDetailViewController: OrderDetailViewController = OrderDetailViewController(nibName: "OrderDetailViewController", bundle: nil);

        return orderDetailViewController;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
