//
//  OrderTableViewCell.swift
//  Drop
//
//  Created by Urmat on 5/11/21.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var orderImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var costLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var initialPointLbl: UILabel!
    @IBOutlet weak var destinationPointLbl: UILabel!
    @IBOutlet weak var detailsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setOrderInfo(orderImg: String, nameLbl: String, costLbl: String, dateLbl: String, initialPointLbl: String, destinationPointLbl: String, detailsLbl: String) {
        self.orderImg.image = UIImage(named: orderImg)
        self.nameLbl.text = nameLbl
        self.costLbl.text = costLbl
        self.dateLbl.text = dateLbl
        self.initialPointLbl.text = initialPointLbl
        self.destinationPointLbl.text = destinationPointLbl
        self.detailsLbl.text = detailsLbl
    }
    
}
