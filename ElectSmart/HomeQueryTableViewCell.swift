//
//  HomeHeaderTableViewCell.swift
//  ElectSmart
//
//  Created by Conner Christianson on 4/18/16.
//  Copyright © 2016 Stephen Gaschignard. All rights reserved.
//

import UIKit

class HomeQueryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        
        dispatch_async(dispatch_get_main_queue(), {
            let myColor : UIColor = UIColor(red: 103.0/255.0, green: 58.0/255.0, blue: 183.0/255.0, alpha: 1.0)
        
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = myColor.CGColor
            border.frame = CGRect(x: 0, y: self.searchText.frame.size.height - width, width: self.searchText.frame.size.width, height: self.searchText.frame.size.height)
        
            border.borderWidth = width
            self.searchText.layer.addSublayer(border)
        })
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
