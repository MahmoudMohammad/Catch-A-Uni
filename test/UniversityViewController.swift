//
//  UniversityViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/16/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import UIKit
import FirebaseDatabase

var myIndex = 0
var newIndex = 0
var text: String!

class UniversityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    
    
    var filteredUni = [String]()
    
    var inSearchMode = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        searchBar.delegate = self
        
        
        searchBar.returnKeyType = UIReturnKeyType.done
        
        Variables.uni = []
        
            let ref = Database.database().reference(withPath: DatabaseURLConstants.universities.uniList)
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                Variables.university = snapshot.value as! [[String:AnyObject]]
                for univ in Variables.university {
                    let uniAcro = univ[DatabaseURLConstants.universities.uniAcronymKey] as! String
                    Variables.uni.append(uniAcro)
                    let uniName = univ[DatabaseURLConstants.universities.uniName] as! String
                    Variables.uniDesc.append(uniName)
                    
                }
                
                self.tableView.reloadData()
            })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredUni.count
        }
        
        return Variables.uni.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DataCell {
            
            
            
            if inSearchMode {
                
                
                text = filteredUni[indexPath.row]
                
            } else {
                
                text = Variables.uni[indexPath.row]
            }
            
            cell.configureCell(text: text)

            
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }

    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        if inSearchMode {
            myIndex = Variables.uni.index(of: text)!
           Variables.currentUniAcro = Variables.uni[myIndex]
        } else {
            myIndex = indexPath.row
            Variables.currentUniAcro = Variables.uni[myIndex]

        }
        performSegue(withIdentifier: "AllDetail", sender: self)
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchBar.text == nil || searchBar.text == "" {
                
                inSearchMode = false
                
                view.endEditing(true)
                
                tableView.reloadData()
                
            } else {
                
                inSearchMode = true
                
                filteredUni = Variables.uni.filter({$0 == searchBar.text?.uppercased()})
                
                tableView.reloadData()
            }
        }
}
