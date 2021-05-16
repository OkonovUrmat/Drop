//
//  OrderViewController.swift
//  Drop
//
//  Created by Urmat on 5/11/21.
//

import UIKit

class OrderViewController: UIViewController  {

    @IBOutlet weak var passengerBtn: UIButton!
    @IBOutlet weak var driverBtn: UIButton!
    @IBOutlet weak var orderTableViiew: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initOrderTableView()
    }

    func initOrderTableView() {
        self.orderTableViiew.delegate = self
        self.orderTableViiew.dataSource = self
    }
    
    @IBAction func passengerBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func driverBtnClicked(_ sender: Any) {
        
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailViewController = OrderDetailViewController(nibName: "OrderDetailViewController", bundle: nil)
        orderDetailViewController.setOrderDetailInfo(orderDetailImg: "Profile", nameLbl: "Smth", costLbl: "Smth", timeLbl: "Smth", dateLbl: "Smth", initialPointLbl: "Smth", destinationPointLbl: "Smth", carLbl: "Smth", detailsLbl: "Smth")
        self.present(orderDetailViewController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let orderCell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell") as? OrderTableViewCell {
            orderCell.setOrderInfo(orderImg: "Profile", nameLbl: "Smth", costLbl: "Smth", dateLbl: "Smth", initialPointLbl: "Smth", destinationPointLbl: "Smth", detailsLbl: "Smth")
            
            return orderCell
        } else {
            return UITableViewCell()
        }
    }
}
