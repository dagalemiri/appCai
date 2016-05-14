//
//  RegistrationViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 03-02-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//
    

import UIKit

class RegistrationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var TableView: UITableView!
    
    
    var kbHeight: CGFloat!
    
    
   // @IBOutlet var vista: UIView!
    // username sin espacios
    // mail solo uc o ing.puc.cl
    // rut, imagen, celular son opcionales
    
    override func viewDidLoad() {
        
        self.TableView.delegate = self
        self.TableView.dataSource = self
        self.TableView.backgroundColor = UIColor.clearColor()
        self.TableView.scrollEnabled = false
        //textField.delegate = self
        
       /* if (table.contentSize.height < table.frame.size.height) {
        table.scrollEnabled = NO;
        }
        else {
        table.scrollEnabled = YES;
        }*/
        
       /* NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil)*/
    }
    
  /*  func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y -= 250
    }
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y += 250
    }*/




    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    
    override func viewWillAppear(animated:Bool) {
        super.viewWillAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            if let keyboardSize =  (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                kbHeight = keyboardSize.height
                self.animateTextField(true)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.animateTextField(false)
    }
    
    func animateTextField(up: Bool) {
        let movement = (up ? -kbHeight : kbHeight)
        
        UIView.animateWithDuration(0.3, animations: {
            self.view.frame = CGRectOffset(self.view.frame, 0, movement)
        })
    }





    @IBAction func AceptarButton(sender: AnyObject) {
        
        
    }
    @IBAction func VolverButton(sender: AnyObject) {
        
       self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = TableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! RegistrationTableViewCell
        cell.layer.cornerRadius = 15
        cell.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        switch (indexPath.section) {
        case 0:
            cell.TextField.placeholder = "Usuario"
        case 1:
            cell.TextField.placeholder = "Contraseña"
        case 2:
            cell.TextField.placeholder = "Repita la contraseña"
        case 3:
            cell.TextField.placeholder = "Nombre"
        case 4:
            cell.TextField.placeholder = "Apellido"
        case 5:
            cell.TextField.placeholder = "Celular"
        default:
            cell.TextField.placeholder = "Mail"
        }
        
        
        return cell
        
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clearColor()
        return headerView
    }
   

    
}
