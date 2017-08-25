//
//  UniDescriptionViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/16/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation

import UIKit


class UniDescriptionViewController: UIViewController {
    
    
    
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moreButton.layer.cornerRadius = 10
        
        titleLabel.text = Variables.uni[myIndex]
        descLabel.text = Variables.uniDesc[myIndex]
        myImageView.image = UIImage(named: Variables.uni[myIndex] + ".jpg")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MoreInfo"{
            
            
    }
    }
    
    
}

