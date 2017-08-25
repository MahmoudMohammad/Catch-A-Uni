//
//  ScholarshipViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/21/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class ScholarshipViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var orgIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        Variables.orgName = []
        
        let ref = Database.database().reference(withPath: DatabaseURLConstants.uniScholarship.uniScholarshipList)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.scholarshipOrg = snapshot.value as! [[String:AnyObject]]
            for org in Variables.scholarshipOrg {
                let orgNa = org[DatabaseURLConstants.uniScholarship.orgName] as! String
                let uniAc = org[DatabaseURLConstants.universities.uniAcronymKey] as! String
                if uniAc == Variables.currentUniAcro{
                    Variables.orgName.append(orgNa)
                }
            }
            if Variables.orgName == []{
                let alert = UIAlertController(title: "Alert", message: "There's no Scholarship for this university", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (alert: UIAlertAction) -> Void in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                self.tableView.reloadData()
            }
            
        })
        
        let ref2 = Database.database().reference(withPath: DatabaseURLConstants.scholarshipOrg.orgList)
        ref2.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.scholarshipOrg = snapshot.value as! [[String:AnyObject]]
            for org in Variables.scholarshipOrg {
                let link = org[DatabaseURLConstants.scholarshipOrg.orgURL] as! String
                Variables.orgURL.append(link)
                
            }
        })
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Variables.orgName.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var link:String = ""
        orgIndex = indexPath.row
        let currentOrg = Variables.orgName[orgIndex]
        if currentOrg == "LASER"{
            link = Variables.orgURL[0]
        }
        else if currentOrg == "Spark"{
            link = Variables.orgURL[1]
        }
        else if currentOrg == "Dafi"{
            link = Variables.orgURL[2]
        }
        else if currentOrg == "Serat"{
            link = Variables.orgURL[3]
        }
    
        
        if let url = URL(string: link){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as? DataCell {
            
            let text: String!
            
            text = Variables.orgName[indexPath.row]
            
            
            cell.configureCell3(text: text)
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }
    
    
    
    
}
