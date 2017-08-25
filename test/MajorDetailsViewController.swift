//
//  MajorDetailsViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/23/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase



class MajorDetailsViewController: UIViewController {
    
    @IBOutlet weak var creditNoLabel: UILabel!
    @IBOutlet weak var creditPriceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference(withPath: DatabaseURLConstants.uniMajors.uniMajorsList)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.majors = snapshot.value as! [[String:AnyObject]]
            for maj in Variables.majors {
                let nu = maj[DatabaseURLConstants.uniMajors.crdtNo] as! Int
                Variables.crdtNo.append(nu)
                let price = maj[DatabaseURLConstants.uniMajors.crdtPrice] as! Int
                Variables.crdtPrice.append(price)
                
            }
            
            self.creditPriceLabel.text = String(Variables.crdtPrice[majIndex])
            self.creditNoLabel.text = String(Variables.crdtNo[majIndex])
            
        })
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
