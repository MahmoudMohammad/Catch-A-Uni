//
//  Constants.swift
//  test
//
//  Created by Najlaa Tarshahani on 8/21/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
struct DatabaseURLConstants {
    
    struct universities {
        static let uniList = "/4/data"
        static let uniAcronymKey = "UniAcronym"
        static let uniName = "UniName"
        static let uniAddress = "Address"
        static let uniDegrees = "Degrees"
        static let uniDescription = "Description"
        static let uniLanguages = "Languages"
        static let uniLocation = "Location"
        static let uniPhoneNo = "PhoneNumber"
        static let uniFees = "RegistrationFees"
        static let uniWebsite = "Website"
        static let uniNeededPaper = "NeededPaper"
        
    }
    
    struct majors {
        static let majorList = "/0/data"
        static let majorsAcronym = "MajorAcronym"
        static let majorName = "MajorName"
        
    }
    
    
    struct scholarshipOrg{
        static let orgList = "/1/data"
        static let orgName = "OrganizationName"
        static let orgURL = "OrganizationURL"
    }
    
    struct uniMajors{
        static let uniMajorsList = "/2/data"
        static let uniAcronym = "UniAcronym"
        static let MajorName = "MajorName"
        static let crdtPrice = "CreditPrice"
        static let crdtNo = "CreditsNo"
    }
    
    
    struct uniScholarship{
        static let uniScholarshipList = "/3/data"
        static let orgName = "OrgName"
        static let uniAcronym = "UniAcronym"
    }
    
    
}
