//
//  MetricCell.swift
//  ProspectAnalyzer
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit

class MetricCell: UICollectionViewCell {
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var metricLabel: UILabel!
    
    
    @IBOutlet weak var barView: UIView!
    
    
    func configureCell(dict: NSDictionary){
        
        let score = dict["score"] as! Float
        let cg = CGFloat(score)
        
        heightConstraint.constant = cg * 100
        
        value.text = String(score)
        
        if let x = dict["tone_name"] as? String{
            metricLabel.text = x
        }

        
    }


}