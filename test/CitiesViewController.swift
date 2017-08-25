//
//  CitiesViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/17/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//


import UIKit

class CitiesViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource{
    
   
    var cityList = ["Saida", "Beirut", "Tyre" , "Beqaa" , "Tripoli"]
    
    @IBOutlet weak var dropDown: UIPickerView!
    
    @IBAction func selectSearch(_ sender: UIButton) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dropDown.delegate = self
        self.dropDown.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return cityList.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return cityList[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
    
}
