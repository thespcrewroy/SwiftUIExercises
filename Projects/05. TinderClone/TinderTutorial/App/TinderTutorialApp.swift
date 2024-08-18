//
//  Title: TinderTutorialApp.swift
//  Author: Swapnil Roy
//  Date Modified: 5/1/24
//
//  Description: The main entry point for the app.
//
//  Variable Type Description:
//  -main: A type that represents the main entry point of the app.
//  -StateObject: A property wrapper type that instantiates an observable object.
//

import SwiftUI

/**
    The main entry point for the app.
*/
@main
struct TinderTutorialApp: App {
    
    @StateObject var matchManager = MatchManager() // create a match manager
    
    var body: some Scene { // create the main scene
        WindowGroup { // create the window group
            MainTabView() // load the main tab view
                .environmentObject(matchManager) // pass the match manager to the main tab view
        } /// WindowGroup
    } /// body
} /// TinderTutorialApp
