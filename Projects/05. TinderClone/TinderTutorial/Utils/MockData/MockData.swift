//
//  Title: MockData.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: A data structure representing mock data.
//

import Foundation

/**
    A data structure representing mock data.
*/
struct MockData {
    static let users: [User] = [ // array of users
        .init( // user 1
            id: NSUUID().uuidString, // id
            fullname: "Breaking Benjamin", // full name
            age:37, // age
            profileImageURLs: ["benjamin", "benjamin2", "benjamin3"] // profile image urls
        ), /// user 1
        .init( // user 2
            id: NSUUID().uuidString, // id
            fullname: "Erling Haaland", // full name
            age:23, // age
            profileImageURLs: ["halaand", "halaand2", "halaand3"] // profile image urls
        ), /// user 2
        .init( // user 3
            id: NSUUID().uuidString, // id
            fullname: "Rowan Atkinson", // full name
            age:69, // age
            profileImageURLs: ["bean", "bean2", "bean3"] // profile image urls
        ) /// user 3
    ] /// users
} /// MockData