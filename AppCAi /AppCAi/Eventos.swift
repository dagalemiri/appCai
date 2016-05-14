//
//  Eventos.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class Eventos: NSObject {
    
    var comision: String!
    var nombre: String!
    
    init(_comision:String,_nombre:String){
        self.comision = _comision
        self.nombre = _nombre
        
    }

}
