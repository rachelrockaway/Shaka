//
//  ComposeViewController.swift
//  Shaka
//
//  Created by Rachel Stevenson on 5/27/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate  {

    @IBOutlet weak var reportTextView: UITextView!
    
    @IBOutlet weak var charactersRemainingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTextView.layer.borderColor = UIColor.blackColor().CGColor
        reportTextView.layer.borderWidth = 0.5
        reportTextView.layer.cornerRadius = 5
        
        reportTextView.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendReport(sender: AnyObject) {
        var report = PFObject(className: "Reports")
        report["content"] = reportTextView.text
        report["reporter"] = PFUser.currentUser()
        
        report.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                //The object has been saved
            } else {
                // There was a problem
            }
    }
            self.navigationController?.popToRootViewControllerAnimated(true)
}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
