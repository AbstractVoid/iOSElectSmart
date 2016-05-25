//
//  CandidateHeaderTableViewCell.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/5/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CandidateHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var candidateNameLabel: UILabel!
    @IBOutlet weak var candidateImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
