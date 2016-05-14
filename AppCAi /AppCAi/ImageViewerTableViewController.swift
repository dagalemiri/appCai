//
//  ImageViewerTableViewController.swift
//  AppCAi
//
//  Created by David Galemiri on 30-03-16.
//  Copyright © 2016 David Galemiri. All rights reserved.
//

import UIKit

class ImageViewerTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
         self.navigationController?.navigationBarHidden = false
         
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
  /*  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("imagen", forIndexPath: indexPath) as! ImageViewerTableViewCell
        return cell
    }*/
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 300
    }
    

    
    
   /* override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }*/


    var imageCache = [String:UIImage]()
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("imagen") as! ImageViewerTableViewCell
        cell.ActiviryIndicator.startAnimating()
        cell.ActiviryIndicator.hidden = false
        cell.Label.text = "hola"
        let urlString = "https://www.mobomo.com/wp-content/uploads/2010/06/apple-logo-300w1.jpg"
        let imgURL = NSURL(string: urlString),
        request: NSURLRequest = NSURLRequest(URL: imgURL!)
        let mainQueue = NSOperationQueue.mainQueue()
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            
                if error == nil {
                        let image = UIImage(data: data!)
                        self.imageCache[urlString] = image
                        dispatch_async(dispatch_get_main_queue(), {
                           // if let cellToUpdate = tableView.cellForRowAtIndexPath(indexPath) {
                                    cell.ActiviryIndicator.stopAnimating()
                                    cell.ActiviryIndicator.hidden = true
                                    cell.Imagen.image = image
                            
                            
                               // }
                            })
                        }
                else {
                    print("Error: \(error!.localizedDescription)")
                }
                    })
                return cell
    }



    
    
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
