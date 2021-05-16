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
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var orderDetailTableView: UITableView!
    
    var orderDetailImage: String = ""
    var name: String = ""
    var cost: String = ""
    var initialPoint: String = ""
    var destinationPoint: String = ""
    var time: String = ""
    var date: String = ""
    var car: String = ""
    var details: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.orderImg.image = UIImage(named: orderDetailImage)
        self.orderNameLbl.text = name
        self.costLbl.text = cost
    }
    
    func setOrderDetailInfo(orderDetailImg: String, nameLbl: String, costLbl: String, timeLbl: String, dateLbl: String, initialPointLbl: String, destinationPointLbl: String, carLbl: String, detailsLbl: String) {
        orderDetailImage = orderDetailImg
        name = nameLbl
        cost = costLbl
    }
    
    @IBAction func connectWithOrderClicked(_ sender: Any) {
    }
}
