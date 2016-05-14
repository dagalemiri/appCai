//
//  Estaticos.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit
import CoreData

class Estaticos: NSObject {
    
    static var UltimoEvento = 0
    static var usuario = ""
    static var MisComisiones = ["Vida Universitaria":true,"Comunidad":false,"Cultura":false,"Deportes":false,"Responsabilidad Social":true,"Política y Actualidad":false,"Sustentabilidad":false,"Emprendimiento":false,"Proyectos":false,"Docencia":false, "Escuela":false, "Representacion":false,"Comunicaciones":false]
    static var ListaEventos = [Eventos(_comision: "vu", _nombre: "TropiCAi"),Eventos(_comision: "vu", _nombre: "Semana San Agustín"),Eventos(_comision: "co", _nombre: "Navidad CAi"),Eventos(_comision: "co", _nombre: "Almuerzo con funcionarios"),Eventos(_comision: "su", _nombre: "Recicla tu prueba")]
    static func moc() -> NSManagedObjectContext { return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext}
    static func Fetch(entity:String) ->[NSObject] {
        let fetchRequest = NSFetchRequest(entityName: entity)
        if let fetchResults = (try? moc().executeFetchRequest(fetchRequest)) as? [NSObject] {
            return fetchResults
        }
        return []
    }
    static func save() {
        do {
            try moc().save()
        }
        catch {
        }
    }
    
    

}
