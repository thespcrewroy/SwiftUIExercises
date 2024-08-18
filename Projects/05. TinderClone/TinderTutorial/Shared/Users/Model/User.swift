//
//  User.swift
//  TinderTutorial
//
//  Created by Swapnil Roy on 5/2/24.
//

import Foundation

struct User: Identifiable, Hashable { // struct to represent a user
    let id: String // user id
    let fullname: String // full name
    var age: Int // age
    var profileImageURLs: [String] // profile image urls
} /// User
