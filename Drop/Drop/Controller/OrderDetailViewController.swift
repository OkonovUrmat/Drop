//
//  OrderDetailViewController.swift
//  Drop
//
//  Created by Urmat on 5/5/21.
//

import UIKit

class OrderDetailViewController: BaseViewController {
    @IBOutlet weak var orderImg: UIImageView!
    @IBOutlet weak var orderNameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var orderDetailTableView: UITableView!
    
    var name: String = ""
    var price: String = ""
    var initialPoint: String = ""
    var destinationPoint: String = ""
    var time: String = ""
    var date: String = ""
    var car: String = ""
    var details: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func connectWithOrderClicked(_ sender: Any) {
    }
}
