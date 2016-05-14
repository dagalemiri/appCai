//
//  FiltrosViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 31-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class FiltrosViewController: UIViewController {

    @IBOutlet weak var SwitchSustentabilidad: UISwitch!
    @IBOutlet weak var SwitchComunidad: UISwitch!
    @IBOutlet weak var SwitchVidaUniversitaria: UISwitch!
    @IBOutlet weak var SwitchProyectos: UISwitch!
    @IBOutlet weak var SwitchDeportes: UISwitch!
    @IBOutlet weak var SwitchPolitica: UISwitch!
    @IBOutlet weak var SwitchDocencia: UISwitch!
    @IBOutlet weak var SwitchRSU: UISwitch!
    @IBOutlet weak var SwitchEmprendimiento: UISwitch!
    @IBOutlet weak var SwitchCultura: UISwitch!
    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ComprobarEstadoSwitch()
    }
    
    func ComprobarEstadoSwitch(){
        if Estaticos.MisComisiones["Comunidad"]!{
            SwitchComunidad.setOn(true, animated: true)
        }
        if Estaticos.MisComisiones["Cultura"]!{
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
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    



}
