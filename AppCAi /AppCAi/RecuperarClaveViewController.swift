//
//  RecuperarClaveViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 27-03-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class RecuperarClaveViewController: UIViewController {

    @IBOutlet weak var NavigationBar: UINavigationBar!
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "http://cai.cl/password/recover");
        let requestObj = NSURLRequest(URL: url!);
        web.loadRequest(requestObj);
        self.NavigationBar.frame.size.height = 50
        // Do any additional setup after loading the view.
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func volver(sender: AnyObject) {
        self.performSegueWithIdentifier("unwindToMenu", sender: self)
    }
    
    // @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
   /* override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        
        // in this case, it's good to combine hidesBarsOnTap with hidesBarsWhenKeyboardAppears
        // so the user can get back to the navigation bar to save
        navigationController?.hidesBarsOnTap = true
        
        navigationController?.hidesBarsWhenKeyboardAppears = true
    }*/

}
