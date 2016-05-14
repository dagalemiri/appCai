//
//  HeaderEventosTableViewCell.swift
//  AppCAi
//
//  Created by David Galemiri on 26-02-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class HeaderEventosTableViewCell: UITableViewCell {

    @IBOutlet var Evento: UILabel!
    
    @IBOutlet var Imagen: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
