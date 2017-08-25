//
//  DetailsViewController.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/21/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase



class DetailsViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var detailsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let ref = Database.database().reference(withPath: DatabaseURLConstants.universities.uniList)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            Variables.university = snapshot.value as! [[String:AnyObject]]
            for univ in Variables.university {
                let desc = univ[DatabaseURLConstants.universities.uniDescription] as! String
                Variables.description.append(desc)
                let add = univ[DatabaseURLConstants.universities.uniAddress] as! String
                Variables.address.append(add)
                var loc = univ[DatabaseURLConstants.universities.uniLocation] as! String
                loc.remove(at: loc.startIndex)
                let tempLoc = loc.substring(to: loc.index(before: loc.endIndex))
                Variables.location.append(tempLoc)
                let phone = univ[DatabaseURLConstants.universities.uniPhoneNo] as! String
                Variables.phoneNo.append(phone)
                var web = univ[DatabaseURLConstants.universities.uniWebsite] as! String
                web.remove(at: web.startIndex)
                let tempWeb2 = web.substring(to: web.index(before: web.endIndex))
                Variables.website.append(tempWeb2)
                let degree = univ[DatabaseURLConstants.universities.uniDegrees] as! String
                Variables.degrees.append(degree)
                let lang = univ[DatabaseURLConstants.universities.uniLanguages] as! String
                Variables.languages.append(lang)
                let fee = univ[DatabaseURLConstants.universities.uniFees] as! Int
                Variables.fees.append(fee)
            
            
            
            }
            self.detailsTextView.delegate = self
            self.detailsTextView.isEditable = false
            
            let linkAttributes = [
                NSLinkAttributeName: Variables.website[myIndex],
            NSForegroundColorAttributeName : UIColor.blue] as [String : Any]
            
            let linkAttributes2 = [
                NSLinkAttributeName: Variables.location[myIndex],
                NSForegroundColorAttributeName : UIColor.blue] as [String : Any]
            
            
            let simple = "University Acronym:\t\(Variables.uni[myIndex])\nUniversity Name:\t\(Variables.uniDesc[myIndex])\nDescription:\t\(Variables.description[myIndex])\nAddress:\t\(Variables.address[myIndex])\nLocation:\t\(Variables.location[myIndex])\nPhone No:\t\(Variables.phoneNo[myIndex])\nWebsite:\t\(Variables.website[myIndex])\nDegrees:\t\(Variables.degrees[myIndex])\nLanguages:\t\(Variables.languages[myIndex])\nFees:\t\(Variables.fees[myIndex])"
            
            let attributed = NSMutableAttributedString(string: simple)

            let range = simple.nsRange(from: simple.range(of: Variables.website[myIndex])!)
            let range2 = simple.nsRange(from: simple.range(of: Variables.location[myIndex])!)
            
            
            attributed.setAttributes(linkAttributes, range: range)
            attributed.setAttributes(linkAttributes2, range: range2)
            
            self.detailsTextView.attributedText = attributed
            self.detailsTextView.adjustsFontForContentSizeCategory = true
            
            

        })
        
        

    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension String {
    func nsRange(from range: Range<Index>) -> NSRange {
        let lower = UTF16View.Index(range.lowerBound, within: utf16)
        let upper = UTF16View.Index(range.upperBound, within: utf16)
        return NSRange(location: utf16.startIndex.distance(to: lower), length: lower.distance(to: upper))
    }
}
