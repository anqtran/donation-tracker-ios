//
//  DonationItemViewCellTableViewCell.swift
//  donation-tracker
//
//  Created by An Tran on 11/24/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class DonationItemCell: UITableViewCell {

    @IBOutlet weak var itemNameTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    func configureCell(item : DonationItem) {
        let title = item.description!
        itemNameTxt.text = title
    }

}
