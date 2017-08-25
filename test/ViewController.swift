//
//  ViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/16/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseAuth


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var selectSearch: UIButton!
    @IBOutlet weak var dropDown: UIPickerView!
    
    
    var list = ["All", "City"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectSearch.layer.cornerRadius = 10
        dropDown.tintColor = UIColor.white
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectSearch(_ sender: UIButton) {
        let index = dropDown.selectedRow(inComponent: 0)
        if list[index] == "All" {
            self.performSegue(withIdentifier: "AllUni", sender: self)
        }
        
//        else if list[index] == "City"{
//            self.performSegue(withIdentifier: "cityName", sender: self)
//        }
    }
    
   
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return list[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        //self.textBox.text = self.list[row]
        //self.dropDown.isHidden = true
        
    }
    

}

