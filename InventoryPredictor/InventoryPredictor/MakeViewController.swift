//
//  MakeViewController.swift
//  InventoryPredictor
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit

class MakeViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = ["VOLKSWAGEN"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationController!.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        
        self.navigationController!.toolbarHidden = false
        self.navigationController!.toolbar.barTintColor = UIColor(colorLiteralRed: 48/255, green: 64/255, blue: 79/255, alpha: 1.0)
    }
 //   48
  //  64 79
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("MakeCell") as? MakeCell{
            cell.textLabel?.text = data[indexPath.row]
            
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.clearColor()
            cell.selectedBackgroundView = backgroundView
            
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("MakeSegue", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let vc = segue.destinationViewController as! ViewController
    }
    
    
    
    
}