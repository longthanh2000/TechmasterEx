//
//  MenuTableViewCell.swift
//  customView2
//
//  Created by Nguyen Thanh Long on 21/07/2023.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet var containImage: UIView!
    @IBOutlet var nameOfFeature: UILabel!
    @IBOutlet var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
