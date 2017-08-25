//
//  DataCell.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/17/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit

class DataCell: UITableViewCell {
    
    
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(text: String) {
        
        label.text = text
    }
    
    func configureCell2(text: String) {
        
        label2.text = text
    }
    
    func configureCell3(text: String) {
        
        label3.text = text
    }
    
    
}
