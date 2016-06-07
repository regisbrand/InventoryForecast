//
//  ProspectSelectedViewController.swift
//  ProspectAnalyzer
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit
import KYCircularProgress

class ProspectSelectedViewController:  UIViewController{
    
    
    @IBOutlet weak var prospectName: UILabel!
    var selectedIndex: Int = 0
    let tableData = ["Michael Johnson","Alred Ahmed","Uncle Steve","Peter Won","Pete Presamps","Fred Alstair"]
    
    let textDataArray = "Person A: Hi Jack.  What are you doing? Person B: Hi Mary.  I'm filling out a job application. Person A: Are you finished with school already? Person B: No.  I have one more semester, but it would be great to have a job lined up. Person A: How is your day going? Person B: Quite busy.  I'm preparing for my presentation tomorrow on our marketing strategy.  I'm not even half done yet. Person A: You must feel stressed out now. Person B: That's an understatement. Person A: What are you doing now? Person B: I'm playing pool with my friends at a pool hall. Person A: I didn't know you play pool.  Are you having fun? Person B:  I'm having a great time.  How about you?  What are you doing? Person A: I'm taking a break from my homework.  There seems to be no end to the amount of work I have to do. Person B: I'm glad I'm not in your shoes."
    
    
    var isDataFetched: Bool = false
    
    @IBOutlet weak var fetchDataButton: UIButton!

    @IBOutlet weak var textView: UITextView!
    
    @IBAction func fetchDataAction(sender: AnyObject) {
        textView.text = textDataArray
        textView.hidden = false
        
        
        if(isDataFetched == true){
            performSegueWithIdentifier("AnalyzerSegue", sender: nil)
        }
        
        isDataFetched = !isDataFetched
        fetchDataButton.setTitle("Process Conversation", forState: UIControlState.Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prospectName.text = tableData[selectedIndex]
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}