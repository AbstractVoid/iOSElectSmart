//
//  CurrentEventsTableViewHeaderCell.swift
//  ElectSmart
//
//  Created by Stephen Gaschignard on 4/17/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class CurrentEventsTableViewHeaderCell: UITableViewCell {
    
    @IBOutlet weak var queryTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        
        let myColor : UIColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = myColor.CGColor
        border.frame = CGRect(x: 0, y: queryTextField.frame.size.height - width, width:  queryTextField.frame.size.width, height: queryTextField.frame.size.height)
        
        border.borderWidth = width
        queryTextField.layer.addSublayer(border)
        queryTextField.layer.masksToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
