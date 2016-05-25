//
//  ElectionHeaderTableViewCell.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/4/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class ElectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var electionTitle: UILabel!
    @IBOutlet weak var electionDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
