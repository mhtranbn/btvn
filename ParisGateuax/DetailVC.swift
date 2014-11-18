//
//  DetailVC.swift
//  ParisGateuax
//
//  Created by mhtran on 11/17/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class DetailVC: UITableViewCell {

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var imageDe: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var priceDe: UILabel!
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
