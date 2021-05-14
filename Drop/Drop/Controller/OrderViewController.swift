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
        self.orderTableViiew.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTableViewCell")
    }
    
    @IBAction func passengerBtnClicked(_ sender: Any) {
        
    }
    
    @IBAction func driverBtnClicked(_ sender: Any) {
        
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Navigation.start(OrderDetailViewController.create())
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
