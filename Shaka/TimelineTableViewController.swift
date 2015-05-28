//
//  TimelineTableViewController.swift
//  Shaka
//
//  Created by Rachel Stevenson on 5/27/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class TimelineTableViewController: UITableViewController, UITableViewDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var timelineData = NSMutableArray()
    
    let backgroundImage = UIImageView(image: UIImage(named: "backgrounda"))
    
    @IBAction func loadData(){
        timelineData.removeAllObjects()
        
        var findTimelineData = PFQuery(className: "Reports")
        
        findTimelineData.findObjectsInBackgroundWithBlock {
            (objects:[AnyObject]?, error:NSError?) -> Void in
            
            if error == nil {
                for object in objects!{
                    self.timelineData.addObject(object)
                }
                
                let array = self.timelineData.reverseObjectEnumerator().allObjects
                self.timelineData = NSMutableArray(array: array)
                
                self.tableView.reloadData()
            }
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.loadData()
        
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = backgroundImage

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return timelineData.count
    }
    
    

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        let report = self.timelineData.objectAtIndex(indexPath.row) as! PFObject
        
        //cell.reportTextView.text = report.objectForKey("content") as? String
        
        //cell.reportTextView.alpha = 0
        //cell.timestampLabel.alpha = 0
        //cell.userNameLabel.alpha = 0
        
        cell.textLabel!.text = "Hello"
        var dataFormatter = NSDateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        //cell.timestampLabel.text = dataFormatter.stringFromDate(report.createdAt!)
        
        //println(sweet.objectForKey("sweeter")!.objectId)
        
        var findReporter:PFQuery = PFUser.query()!
        findReporter.whereKey("objectId", equalTo: report.objectForKey("reporter")!.objectId!!)
        
        findReporter.findObjectsInBackgroundWithBlock {
            (objects:[AnyObject]?, error:NSError?)->Void in
            if error == nil{
                //  println(objects.description)
                let user = (objects as! NSArray).lastObject as! PFUser
                //cell.userNameLabel.text = user.username
                
                UIView.animateWithDuration(0.5, animations:{
                    
//                    cell.sweetTextView.alpha = 1
//                    cell.timestampLabel.alpha = 1
//                    cell.userNameLabel.alpha = 1
//                    
                })
                
            }
            
        }
        // Configure the cell...

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
