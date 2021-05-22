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
        
        setOrderDetailOutlets()
        
        initOrderDetailTableView()
    }

    func initOrderDetailTableView() {
        self.orderDetailTableView.delegate = self
        self.orderDetailTableView.dataSource = self
        self.orderDetailTableView.register(UINib(nibName: "OrderDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderDetailTableViewCell")
        self.orderDetailTableView.estimatedRowHeight = 50.0  //Give an approximation here
        self.orderDetailTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setOrderDetailOutlets() {
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

extension OrderDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let orderDetailCell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTableViewCell") as? OrderDetailTableViewCell {
            
            switch indexPath.row {
            case 2: orderDetailCell.setOrderDetailInfo(title: "SMTH", orderImage: "Clock", body: "Smth")
            case 3: orderDetailCell.setOrderDetailInfo(title: "SMTH", orderImage: "Calendar", body: "Smth")
            case 4: orderDetailCell.setOrderDetailInfo(title: "SMTH", orderImage: "Car", body: "Smth")
            case 5: orderDetailCell.setOrderDetailInfo(title: "SMTH", orderImage: "", body: "Есть 3 свободных мест, есть место для багажа, уточнить у водителя Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique ipsum.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed erat nibh tristique Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ")
                
            default:
                orderDetailCell.setOrderDetailInfo(title: "SMTH", orderImage: "Destination", body: "Smth")
            }
            
            
            
            return orderDetailCell
        } else {
            return UITableViewCell()
        }
    }
}
