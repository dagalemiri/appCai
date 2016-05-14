//
//  ImageViewerTableViewCell.swift
//  AppCAi
//
//  Created by David Galemiri on 30-03-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class ImageViewerTableViewCell: UITableViewCell {

    @IBOutlet weak var Imagen: UIImageView!
    @IBOutlet weak var ActiviryIndicator: UIActivityIndicatorView!
    @IBOutlet weak var Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
