//
//  PostService.swift
//  Makestagram
//
//  Created by Najlaa Tarshahani on 8/11/17.
//  Copyright © 2017 Make Schoole. All rights reserved.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseDatabase

struct UniversityService {
    
    static func create(for name : String) {
        let Ref = Database.database().reference()
        let universityChild = Ref.child("Universities")
        let newUniversity = Universities(name: name)
        let newUniversityRef = universityChild.child(name)
        newUniversityRef.setValue(newUniversity.toAnyObject())
           }
    
//    private static func create(forURLString urlString: String, aspectHeight: CGFloat) {
//        let currentUser = User.current
//        let post = Post(imageURL: urlString, imageHeight: aspectHeight)
//        
//        // 1
//        let rootRef = Database.database().reference()
//        let newPostRef = rootRef.child("posts").child(currentUser.uid).childByAutoId()
//        let newPostKey = newPostRef.key
//        
//        // 2
//        UserService.followers(for: currentUser) { (followerUIDs) in
//            // 3
//            let timelinePostDict = ["poster_uid" : currentUser.uid]
//            
//            // 4
//            var updatedData: [String : Any] = ["timeline/\(currentUser.uid)/\(newPostKey)" : timelinePostDict]
//            
//            // 5
//            for uid in followerUIDs {
//                updatedData["timeline/\(uid)/\(newPostKey)"] = timelinePostDict
//            }
//            
//            // 6
//            let postDict = post.dictValue
//            updatedData["posts/\(currentUser.uid)/\(newPostKey)"] = postDict
//            
//            // 7
//            rootRef.updateChildValues(updatedData)
//        }
//    }
//    
//    static func show(forKey postKey: String, posterUID: String, completion: @escaping (Post?) -> Void) {
//        let ref = Database.database().reference().child("posts").child(posterUID).child(postKey)
//        
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let post = Post(snapshot: snapshot) else {
//                return completion(nil)
//            }
//            
//            LikeService.isPostLiked(post) { (isLiked) in
//                post.isLiked = isLiked
//                completion(post)
//            }
//        })
//    }
}
