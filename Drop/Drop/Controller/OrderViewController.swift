//
//  OrderViewController.swift
//  Drop
//
//  Created by Urmat on 5/11/21.
//

import UIKit

class OrderViewController: BaseViewController  {

    // Main Outlets
    @IBOutlet weak var passengerBtn: UIButton!
    @IBOutlet weak var driverBtn: UIButton!
    @IBOutlet weak var orderTableViiew: UITableView!
    @IBOutlet weak var searchView: UIView!
    
    // Search View Outlets
    @IBOutlet weak var initialPointTxtField: DesignableUITextField!
    @IBOutlet weak var destinationPointTxtField: DesignableUITextField!
    @IBOutlet weak var timeTxtField: DesignableUITextField!
    @IBOutlet weak var dateTxtField: DesignableUITextField!
    @IBOutlet weak var startPayroll: DesignableUITextField!
    @IBOutlet weak var endPayroll: DesignableUITextField!
    
    // Constraint
    @IBOutlet weak var searchViewTopConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        initOrderTableView()
    }

    func initOrderTableView() {
        self.orderTableViiew.delegate = self
        self.orderTableViiew.dataSource = self
    }
    
    // Main Actions
    @IBAction func searchBtnClicked(_ sender: Any) {
        self.searchViewTopConstraint.constant = -540
        
        UIView.animate(withDuration: 0.3, animations:  {
            self.view.layoutIfNeeded()
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        
        if touch?.view != searchView {
            self.searchViewTopConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations:  {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func passengerBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func driverBtnClicked(_ sender: Any) {
        
    }
    
    // Search View Actions
    @IBAction func detailSearchBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func clearBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func sliderDidSlide(_ sender: Any) {
        
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
