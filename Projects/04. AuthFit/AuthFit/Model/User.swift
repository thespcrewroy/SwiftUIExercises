//
//  User.swift
//  AuthFit
//
//  Created by Swapnil Roy on 3/18/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullName: String
    let email: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter() // divide up the full name into components and return the intitials
        if let components = formatter.personNameComponents(from: fullName)  {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return "" // change to return an ProfileView Image later
    }
} // Codable Protocol: takes raw json data and maps into user data object (decoding)

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Kobe Bryant", email: "test@gmail.com")
}
