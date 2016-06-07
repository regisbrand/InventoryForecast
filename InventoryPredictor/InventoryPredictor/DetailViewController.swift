//
//  DetailViewController.swift
//  InventoryPredictor
//
//  Created by khanh tran on 2016-06-03.
//  Copyright © 2016 khanh tran. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var vehicleTitle: UILabel!
    @IBOutlet weak var vehicleImageView: UIImageView!
    
//    @IBOutlet weak var soldBar: UIView!
//    @IBOutlet weak var inStockBar: UIView!
//    @IBOutlet weak var daysSupplyLabel: UIView!
//    @IBOutlet weak var orderQuantityLabel: UIView!
    
    var selectedIndex: Int? = 0
    
    var pickedData: String?
    
    
//    @IBOutlet weak var soldNum: UILabel!
//    @IBOutlet weak var stockNum: UILabel!
//    @IBOutlet weak var supplyNum: UILabel!
//    @IBOutlet weak var orderNum: UILabel!
    
    
    
    let data = [[ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "GOLF WAGON", "sold": 11, "inventory": 15, "orderQuantity": 0, "daySupply": 122 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "GTI A6", "sold": 13, "inventory": 0, "orderQuantity": 0, "daySupply": 0 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "GTI A7", "sold": 14, "inventory": 3, "orderQuantity": 0, "daySupply": 19 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "JETTA", "sold": 50, "inventory": 13, "orderQuantity": 0, "daySupply": 23 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "PASSAT", "sold": 16, "inventory": 5, "orderQuantity": 0, "daySupply": 28 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "TIGUAN", "sold": 70, "inventory": 19, "orderQuantity": 0, "daySupply": 24 ],
                [ "vehicleMake": "VOLKSWAGEN", "vehicleModel": "TOUAREG 3", "sold": 11, "inventory": 14, "orderQuantity": 0, "daySupply": 114 ]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = data[selectedIndex!]["vehicleModel"] as? String{
            if let make = data[selectedIndex!]["vehicleMake"] as? String{
                let s  = make + " " + title
                vehicleTitle.text = s
            }
        }
        
//        if let a = data[selectedIndex!]["sold"] as? Int{
//            soldNum.text = String(a)
//        }
//        
//        if let a = data[selectedIndex!]["inventory"] as? Int{
//            stockNum.text = String(a)
//        }
//        
//        if let a = data[selectedIndex!]["orderQuantity"] as? Int{
//            supplyNum.text =  String(a)
//        }
//        
//        if let a = data[selectedIndex!]["daySupply"] as? Int{
//            orderNum.text =  String(a)
//        }
        
    }
    
}