//
//  BackTableVCTableViewCell.swift
//  AppCAi
//
//  Created by David Galemiri on 25-02-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class BackTableVCTableViewCell: UITableViewCell {

    @IBOutlet var Comision: UILabel!
    
    @IBOutlet weak var Imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
