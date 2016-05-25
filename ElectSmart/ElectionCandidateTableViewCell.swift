//
//  ElectionCandidateTableViewCell.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/4/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class ElectionCandidateTableViewCell: UITableViewCell {

    @IBOutlet weak var candidateName: UILabel!
    @IBOutlet weak var candidateImage: UIImageView!
    @IBOutlet weak var candidateDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
