//
//  BackTableVC.swift
//  AppCAi
//
//  Created by David Galemiri on 31-01-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var TableArray = [String]()
    var CeldaSeleccionada = 0
    
    override func viewDidLoad() {
        TableArray = ["Todos los eventos","Mis eventos","Vida Universitaria","Sustentabilidad","Comunidad","Proyectos","Política y Actualidad","Docencia","Responsabilidad Social","Cultura","Deportes","Emprendimiento"]
        NSLog("\(CeldaSeleccionada)")
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! BackTableVCTableViewCell
       // cell.textLabel?.text = TableArray[indexPath.row]
      
      //  cell.layer.cornerRadius = 20
      //  cell.layer.maskToBounds = true
       /* let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.lightGrayColor()
        cell.selectedBackgroundView = backgroundView*/
        //cell.textLabel?.text = TableArray[indexPath.row]
          cell.Comision.text = TableArray[indexPath.row]
        
      /*  switch TableArray[indexPath.row] {
            case "Comunidad":
                cell.imageView?.image = UIImage(named: "ajustes")
            default:
                cell.imageView?.image = UIImage(named: "inicio")
        }*/
        
    
        
        
        switch TableArray[indexPath.row] {
        case "Comunidad":
            cell.Imagen.image =  UIImage(named: "LogoComunidad")
        case "Vida Universitaria":
            cell.Imagen.image = UIImage(named: "LogoVidaUniversitaria")
        case "Sustentabilidad":
            cell.Imagen.image =  UIImage(named: "LogoSustentabilidad")
        case "Deportes":
            cell.Imagen.image = UIImage(named: "LogoDeportes")
        case "Docencia":
            cell.Imagen.image = UIImage(named: "LogoDocencia")
        case "Emprendimiento":
            cell.Imagen.image = UIImage(named: "LogoEmprendimiento")
        case "Política y Actualidad":
            cell.Imagen.image = UIImage(named: "LogoPolitica")
        case "Responsabilidad Social":
            cell.Imagen.image = UIImage(named: "LogoRSU")
        case "Proyectos":
            cell.Imagen.image = UIImage(named: "LogoProyectos")
        case "Cultura":
            cell.Imagen.image = UIImage(named: "LogoCultura")
        default:
            cell.Imagen.image = UIImage(named: "inicio")
        }
        
        
        
        if indexPath.row == CeldaSeleccionada {
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let navController = segue.destinationViewController as! UINavigationController
        let detailController = navController.topViewController as! EventosTotalesViewController
         let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
        self.CeldaSeleccionada = self.tableView.indexPathForSelectedRow!.row
        detailController.OpcionTabla = indexPath.row
        detailController.LabelTable = TableArray[indexPath.row]
    }
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let index = NSIndexPath(forRow: self.CeldaSeleccionada, inSection: 0)
        tableView.cellForRowAtIndexPath(index)?.backgroundColor = UIColor.darkGrayColor()
        return indexPath
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.CeldaSeleccionada = indexPath.row
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor.lightGrayColor()
    }
    
 /*   override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        self.tableView.indexPathForSelectedRow!
        return indexPath
    }*/
    
    

}