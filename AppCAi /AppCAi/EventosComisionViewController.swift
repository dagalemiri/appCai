//
//  EventosComisionViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 03-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class EventosComisionViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var TableView: UITableView!
    var ListaEventosComision = [TablaEventos]()
    var NombreComision = String()
    var Indice:NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ObtenerEventosComision()
        TableView.dataSource = self
        TableView.delegate = self
       
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func ObtenerEventosComision(){
        let TodosLosEventos = Estaticos.Fetch("TablaEventos") as! [TablaEventos]
        for Evento in TodosLosEventos{
            if Evento.nombreComision == NombreComision {
                ListaEventosComision.append(Evento)
            }
        }
        /*let predicate = NSPredicate(format: "comision == "+)
        let sort = NSSortDescriptor(key:"name", ascending:true)
        
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = [sort]
        
        Estaticos.Fetch("TablaEventos")*/
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EventosComision") as! EventosComisionTableViewCell
        cell.NombreEvento.text = ListaEventosComision[indexPath.row].nombreEvento
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ListaEventosComision.count
    }
    
    
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        Indice = indexPath
        return indexPath
    }
    
    

}
