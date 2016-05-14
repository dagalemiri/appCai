//
//  TablaEventos+CoreDataProperties.swift
//  AppCAi
//
//  Created by David Galemiri on 02-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension TablaEventos {

    @NSManaged var nombreEvento: String?
    @NSManaged var nombreComision: String?
    @NSManaged var idEvento: NSNumber?
    @NSManaged var idComision: NSNumber?
    @NSManaged var fechaInicio: String?
    @NSManaged var fechaFin: String?
    @NSManaged var diaInicio: String?
    @NSManaged var diaFin: String?
    @NSManaged var horaInicio: String?
    @NSManaged var horaFin: String?
    @NSManaged var descripcion: String?
    @NSManaged var imagenURL: String?

}
