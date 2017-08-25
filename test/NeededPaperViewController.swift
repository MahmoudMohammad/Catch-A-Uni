//
//  NeededPaperViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/21/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class NeededPaperViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref = Database.database().reference(withPath: DatabaseURLConstants.universities.uniList)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.university = snapshot.value as! [[String:AnyObject]]
            for univ in Variables.university {
                let uniPaper = univ[DatabaseURLConstants.universities.uniNeededPaper] as! String
                Variables.neededPaper.append(uniPaper)}
            
            
            self.textView.text = "\(Variables.uni[myIndex]) Needed Paper for Registration are:\n\n\(Variables.neededPaper[myIndex])"
                })
        
        self.textView.isEditable = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
