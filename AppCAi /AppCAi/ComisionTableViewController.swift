//
//  ComisionTableViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class ComisionTableViewController: UITableViewController {

    var NombreComision = String()
    var Descripcion = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.navigationItem.title = NombreComision
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath:
        NSIndexPath) -> NSIndexPath? {
            switch (indexPath.section,indexPath.row){
            case (1,0):
                let Alerta = UIAlertController(title: "¿Deseas unirte a la comisión de "+NombreComision, message: "", preferredStyle: UIAlertControllerStyle.Alert)
                
                Alerta.addAction(UIAlertAction(title: "SI :)!", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
                }))
                Alerta.addAction(UIAlertAction(title: "NO :(", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Cancel Logic here")
                }))
                presentViewController(Alerta, animated: true, completion: nil)
            case (1,1):
                let Alerta = UIAlertController(title: "Descripcion de la comisión "+NombreComision, message: self.Descripcion, preferredStyle: UIAlertControllerStyle.Alert)
                
                Alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
                }))
                presentViewController(Alerta, animated: true, completion: nil)
            default:
                break
            }
            
            
        
        return indexPath
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Descripcion" {

        }
        else if segue.identifier == "Eventos" {
            let controlador = segue.destinationViewController as! EventosComisionViewController
            controlador.NombreComision = NombreComision
        }
    }
    

    

}
