//
//  ComposeViewController.swift
//  Shaka
//
//  Created by Rachel Stevenson on 5/2/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var ReportTextView: UITextView!
    
    @IBOutlet weak var CharacterRemainingLabel: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ReportTextView.layer.borderColor = UIColor.blackColor().CGColor
        ReportTextView.layer.borderWidth = 0.5
        ReportTextView.layer.cornerRadius = 5
        ReportTextView.delegate = self
        
        ReportTextView.becomeFirstResponder()
        
    }
    
    
    @IBAction func SendReport(sender: AnyObject) {
    }
    
}
    
    

    

