//
//  TablaEventos.swift
//  AppCAi
//
//  Created by David Galemiri on 02-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import Foundation
import CoreData


class TablaEventos: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    static func createInManagedObjectContext(moc: NSManagedObjectContext, nombreComision:String,nombreEvento:String,descripcion:String,idEvento: Int,idComision:Int,horaInicio:String,diaInicio:String,fechaInicio:String,imagenURL:String){
        let nuevoElemento = NSEntityDescription.insertNewObjectForEntityForName("TablaEventos", inManagedObjectContext: moc) as! TablaEventos
        nuevoElemento.nombreComision = nombreComision
        nuevoElemento.nombreEvento = nombreEvento
        nuevoElemento.idEvento = idEvento
        nuevoElemento.idComision = idComision
        nuevoElemento.descripcion = descripcion
        nuevoElemento.diaInicio = diaInicio
        nuevoElemento.horaInicio = horaInicio
        nuevoElemento.fechaInicio = fechaInicio
        nuevoElemento.imagenURL = imagenURL
    
    }
}

