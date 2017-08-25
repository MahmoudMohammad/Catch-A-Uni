//
//  MajorsViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/21/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

var uniAcron : String = ""
var majIndex = 0

class MajorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    var filteredMajor = [String]()
    
    var inSearchMode = false
    var text: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        Variables.majorName = []

            let ref = Database.database().reference(withPath: DatabaseURLConstants.uniMajors.uniMajorsList)
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.majors = snapshot.value as! [[String:AnyObject]]
            for maj in Variables.majors {
                let majorNa = maj[DatabaseURLConstants.uniMajors.MajorName] as! String
                
                uniAcron = maj[DatabaseURLConstants.universities.uniAcronymKey] as! String
                if uniAcron == Variables.currentUniAcro{
                    Variables.majorName.append(majorNa)
                }
            }
            
            self.tableView.reloadData()
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
        
        if inSearchMode {
            
            return filteredMajor.count
        }
        
        return Variables.majorName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as? DataCell {
            
            
            
            if inSearchMode {
                
                text = filteredMajor[indexPath.row]
                
            } else {
                
                text = Variables.majorName[indexPath.row]
            }
            
            cell.configureCell2(text: text)
            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if inSearchMode {
            myIndex = Variables.majorName.index(of: text)!
            
        } else {
            myIndex = indexPath.row
            
            
        }

        
        performSegue(withIdentifier: "majorDetailsSegue", sender: self)
    }
    
    
    // MARK: - UITableViewDataSource
    
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            
            inSearchMode = false
            
            view.endEditing(true)
            
            tableView.reloadData()
            
        } else {
            
            inSearchMode = true
            
            filteredMajor = Variables.majorName.filter({$0 == searchBar.text})
            
            tableView.reloadData()
        }
    }

    
    
}
