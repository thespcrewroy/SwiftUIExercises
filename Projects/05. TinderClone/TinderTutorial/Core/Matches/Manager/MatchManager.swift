//
//  Title: MatchManager.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Manager to handle matching logic.
//
//  Variable Type Descriptions:
//  - MainActor: An actor that runs on the main thread.
//  - ObservableObject: A class that can be observed by a view and notifies the view when the object changes.
//  - Published: A property wrapper that publishes the changes of the property.
//  - User: A data structure representing a user.
//

import Foundation

/**
    Manager to handle matching logic.
*/
@MainActor
class MatchManager: ObservableObject {
    
    @Published var matchedUser: User? // matched user
    
    /**
        Function to check for a match with a user.
     
        @param user: The user to check for a match with.
    */
    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random() // randomly determine if there is a match
        if didMatch { // if there is a match
            matchedUser = user // set the matched user
        } /// if
    } /// checkForMatch
} /// MatchManager
