//
//  ViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 30-12-15.
//  Copyright © 2015 David Galemiri. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate {
    

    @IBOutlet weak var Navigation: UINavigationItem!
    @IBOutlet var usuario: UITextField!
    @IBOutlet var contraseña: UITextField!
    @IBOutlet var ActivityIndicator: UIActivityIndicatorView!
    
    var kbHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initAppearance()
        usuario.delegate = self
        contraseña.delegate = self
        ActivityIndicator.hidden = true
        self.navigationController?.navigationBarHidden = true
       // UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
        var frameRect:CGRect = contraseña.frame
        frameRect.size.height = 100; // <-- Specify the height you want here.
        contraseña.frame = frameRect
       // self.view.backgroundColor = UIColor.init(red: 251/255, green: 211/255, blue: 7/255, alpha: 1)
        
        
        if Usuario.ObtenerUsuario() == "" || Usuario.ObtenerPassword() == "" {

        }
        else {
            self.iniciarSesionAutomaticamente(false)
        }
        
        
    
        
        
    }
    
    
    func iniciarSesionAutomaticamente(verificador:Bool){
        
        var usuarioTexto = String()
        var passwordTexto = String()
        
        if verificador {
            usuarioTexto = self.usuario.text!
            passwordTexto = self.contraseña.text!
        }
        else {
            usuarioTexto = Usuario.ObtenerUsuario()
            passwordTexto = Usuario.ObtenerPassword()
        }
        contraseña.resignFirstResponder()
        usuario.resignFirstResponder()
        
        ActivityIndicator.hidden = false
        ActivityIndicator.startAnimating()
        self.ActivityIndicator.backgroundColor = UIColor.init(white: 0.3, alpha: 0.2)
        
        let uri = "http://api.cai.cl/login/"+usuarioTexto+"/"+passwordTexto
        print(usuarioTexto)
        print(passwordTexto)
        
        let request = NSMutableURLRequest(URL: NSURL(string: uri)!)
        request.HTTPMethod = "POST"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            
            print(error)
            
            if let httpResponse = response as? NSHTTPURLResponse {
                switch(httpResponse.statusCode) {
                case 200:
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        if verificador {
                            let Alerta = UIAlertController(title: "Se guardarán tus datos para iniciar sesión automáticamente", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                            Alerta.addAction(UIAlertAction(title: "Continuar", style: .Default, handler: { (action: UIAlertAction!) in
                                
                                Usuario.CambioUsuario(usuarioTexto)
                                Usuario.CambiarPassword(passwordTexto)
                                
                                print("\("Username: "+Usuario.ObtenerUsuario())")
                                print("\("Password: "+Usuario.ObtenerPassword())")
                                
                                self.ActivityIndicator.stopAnimating()
                                self.ActivityIndicator.hidden = true

                                self.performSegueWithIdentifier("app", sender: self)
                            }))
                            self.presentViewController(Alerta, animated: true, completion: nil)
                        }
                        else {
                            
                            Usuario.CambioUsuario(usuarioTexto)
                            Usuario.CambiarPassword(passwordTexto)
                            
                            print("\("Username: "+Usuario.ObtenerUsuario())")
                            print("\("Password: "+Usuario.ObtenerPassword())")
                            
                            self.ActivityIndicator.stopAnimating()
                            self.ActivityIndicator.hidden = true
                            self.performSegueWithIdentifier("app", sender: self)
                        }
                    })
                case 404:
                    let Alerta = UIAlertController(title: "Error", message: "Usuario o contraseña incorrectos, por favor intente nuevamente", preferredStyle: UIAlertControllerStyle.Alert)
                    Alerta.addAction(UIAlertAction(title: "Continuar", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
                    }))
                    dispatch_async(dispatch_get_main_queue(), {
                        self.presentViewController(Alerta, animated: true, completion: nil)
                        self.ActivityIndicator.stopAnimating()
                        self.ActivityIndicator.hidden = true
                    })
                    return
                default:
                    let Alerta = UIAlertController(title: "Error", message: "Ocurrió un problema al iniciar sesión, por favor intente nuevamente", preferredStyle: UIAlertControllerStyle.Alert)
                    Alerta.addAction(UIAlertAction(title: "Continuar", style: .Default, handler: { (action: UIAlertAction!) in print("Handle Ok logic here")
                    }))
                    dispatch_async(dispatch_get_main_queue(), {
                        self.presentViewController(Alerta, animated: true, completion: nil)
                        self.ActivityIndicator.stopAnimating()
                        self.ActivityIndicator.hidden = true
                    })
                    return
                }}
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
  /*  override func shouldAutorotate() -> Bool {
        return false;
    }*/
    
      @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
    }
    
    func navigationControllerSupportedInterfaceOrientations(navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
 
    
    @IBAction func Ingresar(sender: AnyObject) {
        self.iniciarSesionAutomaticamente(true)
    }
    
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
        
        self.usuario.text = Usuario.ObtenerUsuario()
        self.contraseña.text = Usuario.ObtenerPassword()

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y < 0 {
        }
        else {
            if let userInfo = notification.userInfo {
                if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                    kbHeight = keyboardSize.height
                    self.animateTextField(true)
                }
            }
        }
        
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func animateTextField(up: Bool) {
        let movement = (up ? -kbHeight : kbHeight)
        UIView.animateWithDuration(0.3, animations: {
           // self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }
    
 /*   func keyboardWillShow(sender: NSNotification) {
        if self.view.frame.origin.y < 0 {
        }
        else {
            self.view.frame.origin.y -= 250
        }
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 250
    }*/
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func initAppearance() -> Void {
        
        let background = CAGradientLayer().yellowColor()
        background.frame = self.view.bounds
        self.view.layer.insertSublayer(background, atIndex: 0)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "app"{
            Estaticos.usuario = self.usuario.text!
        }
    }
    
    


}


extension CAGradientLayer {
    
    func yellowColor() -> CAGradientLayer {
        let topColor = UIColor(red: 251/255, green: 211/255, blue: 7/255, alpha: 1)
        let bottomColor = UIColor(red: (255.0/255.0), green: (230.0/255.0), blue: (0/255.0), alpha: 1)

        
        let gradientColors: [CGColor] = [bottomColor.CGColor,topColor.CGColor]
        let gradientLocations: [Float] = [0.0, 0.75]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}
