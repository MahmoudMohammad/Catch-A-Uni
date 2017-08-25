//
//  Universities.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/18/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase.FIRDataSnapshot

struct Universities{
    
    var name :String
    
    init(name:String) {
        self.name = name
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        self.name = snapshotValue["name"] as! String
        
    }
    
    func toAnyObject()-> Any {
        return ["name": self.name]
    }

}
