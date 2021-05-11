//
//  OrderDetailTableViewCell.swift
//  Drop
//
//  Created by Urmat on 5/10/21.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var orderImg: UIImageView!
    @IBOutlet weak var bodyTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
