//
//  OpcionesTableViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class OpcionesTableViewController: UITableViewController {

    @IBOutlet weak var Nombre: UILabel!
    
    var Indice = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //  self.ComprobarEstadoSwitch()
        self.Nombre.text = Usuario.ObtenerUsuario()
    }


 /*   override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        tableView.cellForRowAtIndexPath(indexPath)?.contentView.backgroundColor = UIColor.whiteColor()
        return indexPath
    }*/
    
 /*   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if (cell?.selected) != nil {
            cell!.backgroundColor = UIColor.whiteColor()
        }
        return cell!
    }*/
    
 /*   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Comisiones", forIndexPath: indexPath) as! UITableViewCell
        cell.detailTextLabel?.textColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        return cell
    }*/
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1{
            if indexPath.row == 0{
                if Usuario.GetMisComisiones()["Vida Universitaria"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                   
                }
            }
            else if indexPath.row == 1{
                if Usuario.GetMisComisiones()["Comunidad"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                }
            }
            else if indexPath.row == 2{
                if Usuario.GetMisComisiones()["Responsabilidad Social"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                }
            }
            else if indexPath.row == 3{
                if Usuario.GetMisComisiones()["Deportes"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                }
            }
            else if indexPath.row == 4{
                if Usuario.GetMisComisiones()["Proyectos"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                }
            }
            else if indexPath.row == 5{
                if Usuario.GetMisComisiones()["Cultura"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                    
                }
            }
            else if indexPath.row == 6{
                if Usuario.GetMisComisiones()["Política y Actualidad"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                    
                }
            }
            else if indexPath.row == 7{
                if Usuario.GetMisComisiones()["Sustentabilidad"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                    
                }
            }
            else if indexPath.row == 8{
                if Usuario.GetMisComisiones()["Docencia"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                    
                }
            }
            else if indexPath.row == 9{
                if Usuario.GetMisComisiones()["Comunicaciones"]!{
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
                    cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.accessoryType = .Checkmark
                }
            }
            
            
            
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        Indice = indexPath.row
      //  tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor.whiteColor()
        if indexPath.section == 1 {
            let cell = tableView.cellForRowAtIndexPath(indexPath)!
            let comision = cell.textLabel?.text
            if cell.accessoryType == .Checkmark {
                cell.accessoryType = .None
                cell.detailTextLabel?.text = "No agregado a mis eventos"
                cell.detailTextLabel?.textColor = UIColor.redColor()
            } else {
                cell.accessoryType = .Checkmark
            cell.detailTextLabel?.text = "Agregado a mis eventos"
                    cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            }
            if Usuario.GetMisComisiones()[comision!]!{
                Usuario.CambiarMisComisiones(comision!, valor: false)
            }
            else {
                Usuario.CambiarMisComisiones(comision!, valor: true)
            }
        }
        else if indexPath.section == 3 {
            let Alerta = UIAlertController(title: "Cerrar sesión", message: "¿Estas seguro?", preferredStyle: UIAlertControllerStyle.Alert)
            Alerta.addAction(UIAlertAction(title: "Si", style: .Default, handler: { (action: UIAlertAction!) in
            
                Usuario.CambioUsuario("")
                Usuario.CambiarPassword("")
                
                print("\("Username: "+Usuario.ObtenerUsuario())")
                print("\("Password: "+Usuario.ObtenerPassword())")
                Usuario.BorrarMisComisiones()
                
                self.performSegueWithIdentifier("unwindToMenu", sender: self)
            
            
            }))
            Alerta.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
            }))
            self.presentViewController(Alerta, animated: true, completion: nil)
            
        }
    }
    
  
    
    
/*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let comision = cell?.textLabel?.text
        
        if  Estaticos.MisComisiones[comision!]! {
            cell!.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        }
        else {
            cell!.detailTextLabel?.textColor = UIColor.redColor()
        }
        return cell!
    }*/
    
    
    /*
    
    @IBAction func EventoVidaUniversitaria(sender: AnyObject) {
        if SwitchVidaUniversitaria.on {
            Estaticos.MisComisiones["Vida Universitaria"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Vida Universitaria"] = false
            print(Estaticos.MisComisiones)
        }
    }
    
    @IBAction func EventoSustentabilidad(sender: AnyObject) {
        if SwitchSustentabilidad.on {
            Estaticos.MisComisiones["Susentabilidad"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Susentabilidad"] = false
            print(Estaticos.MisComisiones)
        }
        
    }
    @IBAction func EventoComunidad(sender: AnyObject) {
        if SwitchComunidad.on {
            Estaticos.MisComisiones["Comunidad"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Comunidad"] = false
            print(Estaticos.MisComisiones)
        }
    }
    
    @IBAction func EventoProyectos(sender: AnyObject) {
        if SwitchProyectos.on {
            Estaticos.MisComisiones["Proyectos"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Proyectos"] = false
            print(Estaticos.MisComisiones)
        }
        
    }
    
    @IBAction func EventoDeportes(sender: AnyObject) {
        if SwitchDeportes.on {
            Estaticos.MisComisiones["Deportes"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Deportes"] = false
            print(Estaticos.MisComisiones)
        }
        
    }
    
    @IBAction func EventoPolitica(sender: AnyObject) {
        if SwitchPolitica.on {
            Estaticos.MisComisiones["Politica y Actualidad"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Politica y Actualidad"] = false
            print(Estaticos.MisComisiones)
        }
    }
    
    @IBAction func EventoDocencia(sender: AnyObject) {
        if SwitchDocencia.on {
            Estaticos.MisComisiones["Docencia"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Docencia"] = false
            print(Estaticos.MisComisiones)
        }
        
    }
    
    
    @IBAction func EventoRSU(sender: AnyObject) {
        if SwitchRSU.on {
            Estaticos.MisComisiones["RSU"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["RSU"] = false
            print(Estaticos.MisComisiones)
        }
    }
    
    @IBAction func EventoEmprendimiento(sender: AnyObject) {
        if SwitchEmprendimiento.on {
            Estaticos.MisComisiones["Emprendimiento"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Emprendimiento"] = false
            print(Estaticos.MisComisiones)
        }
    }
    
    @IBAction func EventoCultura(sender: AnyObject) {
        if SwitchCultura.on {
            Estaticos.MisComisiones["Cultura"] = true
            print(Estaticos.MisComisiones)
        }
        else {
            Estaticos.MisComisiones["Cultura"] = false
            print(Estaticos.MisComisiones)
        }
    }
    */
  
    func ComprobarEstadoSwitch(){
        if Estaticos.MisComisiones["Comunidad"]!{
            let cell = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 3, inSection: 1))!
                cell.accessoryType = .Checkmark
                cell.detailTextLabel?.text = "Agregado a mis eventos"
                cell.detailTextLabel?.textColor =  UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
            }
        else {
            let cell1 = self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 3, inSection: 1))! as! UITableViewCell
            cell1.accessoryType = .Checkmark
            cell1.accessoryType = .None
            cell1.detailTextLabel?.text = "No agregado a mis eventos"
            cell1.detailTextLabel?.textColor = UIColor.redColor()
            }
        }
    //}
      /*  if Estaticos.MisComisiones["Cultura"]!{
            SwitchCultura.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["Deportes"]!{
            SwitchDeportes.setOn(true, animated: true)
        }
        if Estaticos.MisComisiones["Emprendimiento"]!{
            SwitchEmprendimiento.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["Politica y Actualidad"]!{
            SwitchPolitica.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["Proyectos"]!{
            SwitchProyectos.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["RSU"]!{
            SwitchRSU.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["Sustentabilidad"]!{
            SwitchSustentabilidad.setOn(true, animated: true)
            
        }
        if Estaticos.MisComisiones["Vida Universitaria"]!{
            SwitchVidaUniversitaria.setOn(true, animated: true)
            
        }*/
        
        
   // }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
