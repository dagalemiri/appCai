//
//  Usuario.swift
//  AppCAi
//
//  Created by David Galemiri on 01-04-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class Usuario: NSObject {
    
    static var MisComisiones = ["Vida Universitaria":false,"Comunidad":false,"Cultura":false,"Deportes":false,"Responsabilidad Social":false,"Política y Actualidad":false,"Sustentabilidad":false,"Emprendimiento":false,"Proyectos":false,"Docencia":false, "Escuela":false, "Representacion":false,"Comunicaciones":false]
    
    class func CambioUsuario(usuario:String) {
        AppDelegate.defaults.setObject(usuario,forKey: "Username")
    }
    
    class func CambiarPassword(password:String) {
        AppDelegate.defaults.setObject(password,forKey: "Password")
    }
    
    class func ObtenerUsuario() -> String {
        return AppDelegate.defaults.objectForKey("Username") as? String ?? String()
    }
    
    class func ObtenerPassword() -> String {
        return AppDelegate.defaults.objectForKey("Password") as? String ?? String()
    }
    
    class func CambiarMisComisiones(comision:String,valor:Bool) {
        var aux = AppDelegate.defaults.objectForKey("MisComisiones") as! [String:Bool]
        aux[comision] = valor
        AppDelegate.defaults.setObject(aux,forKey: "MisComisiones")
        print("\(AppDelegate.defaults.objectForKey("MisComisiones") as? [String:Bool] ?? [String:Bool]())")
        
    }
    
    class func BorrarMisComisiones() {
        AppDelegate.defaults.setObject(MisComisiones,forKey: "MisComisiones")
    }
    
    class func GetMisComisiones() ->[String:Bool] {
        let comisiones = AppDelegate.defaults.objectForKey("MisComisiones") as? [String:Bool] ?? [String:Bool]()
        if comisiones.count == 0 {
            print("\(1)")
            print("\(MisComisiones)")
            AppDelegate.defaults.setObject(MisComisiones,forKey: "MisComisiones")
            return MisComisiones
        }
        else {
            print(comisiones.count)
            print("\(2)")
            print("\(comisiones)")
            return comisiones
        }
        
    }
    
    
    

}
