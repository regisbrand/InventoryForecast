//
//  AnalyzerViewController.swift
//  ProspectAnalyzer
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AnalyzerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
        let textDataArray = "Person A: Hi Jack.  What are you doing? Person B: Hi Mary.  I'm filling out a job application. Person A: Are you finished with school already? Person B: No.  I have one more semester, but it would be great to have a job lined up. Person A: How is your day going? Person B: Quite busy.  I'm preparing for my presentation tomorrow on our marketing strategy.  I'm not even half done yet. Person A: You must feel stressed out now. Person B: That's an understatement. Person A: What are you doing now? Person B: I'm playing pool with my friends at a pool hall. Person A: I didn't know you play pool.  Are you having fun? Person B:  I'm having a great time.  How about you?  What are you doing? Person A: I'm taking a break from my homework.  There seems to be no end to the amount of work I have to do. Person B: I'm glad I'm not in your shoes."
    
    
    /*
 
     {
     "credentials": {
     "url": "https://gateway.watsonplatform.net/tone-analyzer/api",
     "password": "dICpHmWP6eE7",
     "username": "bd1c5f68-7b02-45e4-aab7-b218eab429bc"
     }
     }
 */
    
    var emotion: NSArray?
    var language: NSArray?
    var social: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let user = "bd1c5f68-7b02-45e4-aab7-b218eab429bc"
        let password = "dICpHmWP6eE7"
        let credentialData = "\(user):\(password)".dataUsingEncoding(NSUTF8StringEncoding)!
        let base64Credentials = credentialData.base64EncodedStringWithOptions([])
        let headers = ["Authorization": "Basic \(base64Credentials)"]
        
        let post = ["text":textDataArray]
        
        Alamofire.request(.POST, "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19/\(user)/\(password)",
            parameters: post, encoding: .JSON, headers: headers)
            .responseJSON {(response) in
               // print(response)
                
                if let JSON = response.result.value {
              //      print("JSON: \(JSON)")
                    
                    
                    if let x = JSON["document_tone"] as? NSDictionary {
                        
                        print(x)
                        if let categories = x["tone_categories"] as? NSArray{
                            
                            if let emotionTone = categories[0] as? NSDictionary{
                            
                                if let tones = emotionTone["tones"] as? NSArray{
                                    self.emotion = tones
                                }
                                
                                
                                
                            }
                            
                            
                            if let languageTone = categories[1] as? NSDictionary{
                                
                                if let tones = languageTone["tones"] as? NSArray{
                                    self.language = tones
                                }
                                
                                //    print(emotionTone)
                                
                            }
                            
                            if let socialTone = categories[2] as? NSDictionary{
                                
                                if let tones = socialTone["tones"] as? NSArray{
                                    self.social = tones
                                }
                                
                                //    print(emotionTone)
                                
                            }
                            
                            self.collectionView.reloadData()
                            
                            
                        }
                        
                        
                    }
                    
                    
                    

                    let y = 199
                    
                }
                
                
        }

        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MetricCell", forIndexPath: indexPath) as! MetricCell
        
        switch indexPath.section {
        case 0:
            print("")
            if (emotion != nil){
                if let item = emotion![indexPath.row] as? NSDictionary{
                    cell.configureCell(item)
                }
            }
            
            cell.barView.backgroundColor = UIColor.orangeColor()

        case 1:
            
            if(language != nil){
                if let item = language![indexPath.row] as? NSDictionary{
                    cell.configureCell(item)
                }
            }
            
            cell.barView.backgroundColor = UIColor.blueColor()

            
        case 2:
            
            if(social != nil){
                
                if let item = social![indexPath.row] as? NSDictionary{
                    cell.configureCell(item)
                }
                
            }
            
            cell.barView.backgroundColor = UIColor.greenColor()

            
        default:
            print("")
        }
        
        return cell
        
    }
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            if(emotion == nil){
                return 0
            }
            return 5
        case 1:
            if(language == nil){
                return 0
            }
            return 3
        case 2:
            
            if(social == nil){
                return 0
            }
            return 5
        default:
            return 0
        }
        
    }
    
}