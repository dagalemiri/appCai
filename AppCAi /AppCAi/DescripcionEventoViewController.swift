//
//  DescripcionEventoViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 03-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class DescripcionEventoViewController: UIViewController {

    @IBOutlet weak var NombreEvento: UILabel!
    @IBOutlet weak var NombreComision: UILabel!
    @IBOutlet weak var Descripcion: UILabel!
    
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var Fecha: UILabel!
    

    
    var NombreEventoContent = String()
    var NombreComisionContent = String()
    var DescripcionContent = String()
    var FechaContent = String()
    var imagenContento = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NombreEvento.text = self.NombreEventoContent
        NombreComision.text = self.NombreComisionContent
        Descripcion.text = self.DescripcionContent
        Fecha.text = self.FechaContent
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



}
