//
//  GnomesTableViewCell.swift
//  BrastleFacebook
//
//  Created by Eduardo Monroy Husillos on 2/6/21.
//

import UIKit

class GnomesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var imgGnome: UIImageView!
    @IBOutlet weak var lbNameGnome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
