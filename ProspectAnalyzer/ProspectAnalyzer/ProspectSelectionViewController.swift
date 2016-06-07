//
//  ProspectSelectionViewController.swift
//  ProspectAnalyzer
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit

class ProspectSelectionViewcontroller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController!.toolbarHidden = false
        self.navigationController!.toolbar.barTintColor = UIColor(colorLiteralRed: 48/255, green: 64/255, blue: 79/255, alpha: 1.0)
    }
    
    let tableData = ["Michael Johnson","Alred Ahmed","Uncle Steve","Peter Won","Pete Presamps","Fred Alstair"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ProspectSelectionCell") as? ProspectSelectionCell{
            cell.theTitle.text = tableData[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("DetailSegue", sender: indexPath.row)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! ProspectSelectedViewController
        vc.selectedIndex = (sender as? Int)!
    }
    
    
    
    
}

