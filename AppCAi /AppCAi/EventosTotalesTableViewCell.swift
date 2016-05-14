//
//  EventosTotalesTableViewCell.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class EventosTotalesTableViewCell: UITableViewCell {

    @IBOutlet weak var NombreEvento: UILabel!
    
    @IBOutlet weak var NombreComision: UILabel!
    
    @IBOutlet weak var FechaEvento: UILabel!
    
    @IBOutlet weak var Imagen: UIImageView!
    
    @IBOutlet weak var Texto: UITextView!
    
    @IBOutlet weak var a: UILabel!
    
    class var expandedHeight : CGFloat {get {return 800 } }
    class var defaultHeight  : CGFloat {get {return 400} }
    
    func checkHeight() {
        
    }
    
    func watchFrameChanges() {
        addObserver(self, forKeyPath: "frame", options: .New, context: nil)
        
    }
    
    func ignoreFrameChanges() {
        removeObserver(self, forKeyPath: "frame")    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "frame" {
            checkHeight()
        }
    }
    
    func textViewDidChange(textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.max))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame;
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
