//
//  WebRegisterViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 07-03-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class WebRegisterViewController: UIViewController {

    @IBOutlet var web: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "http://cai.cl/registro/");
        let requestObj = NSURLRequest(URL: url!);
        web.loadRequest(requestObj);
        self.navigationController?.navigationBarHidden = false
        

        // Do any additional setup after loading the view.
    }

   /* override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        
        // in this case, it's good to combine hidesBarsOnTap with hidesBarsWhenKeyboardAppears
        // so the user can get back to the navigation bar to save
        navigationController?.hidesBarsOnTap = true
        
        navigationController?.hidesBarsWhenKeyboardAppears = true
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func VolverButton(sender: AnyObject) {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
