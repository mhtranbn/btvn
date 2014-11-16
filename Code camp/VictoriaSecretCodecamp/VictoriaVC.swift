//
//  VictoriaVC.swift
//  VictoriaSecret
//
//  Created by mhtran on 11/16/14.
//  Copyright (c) 2014 mhtran. All rights reserved.
//

import UIKit

class VictoriaVC: UITableViewCell {
    
    @IBOutlet weak var Scroll: UIScrollView!
  
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var avata: UIImageView!
    
    @IBOutlet weak var numberLike: UILabel!
       override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
