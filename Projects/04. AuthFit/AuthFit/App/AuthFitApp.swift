//
//  AuthFitApp.swift
//  AuthFit
//
//  Created by Swapnil Roy on 3/11/24.
//
//  Future:
// * Add a splash screen
// * Add a loading screen
// * Add a welcome screen
// * Add a home screen
// * Implement fitness functionality
// * Implement recepie functionality
// * Implement store functionality
// * Finish delete account function
// * Add forgot password functionality
// * Add a settings screen
// * Add a google/facebook/other sign-in buttons/functionalities
// * Look at projects doc + other people's nmix midterm/final projects for inspration
// * Extract/Refactor/ButtonStyle Nav Links, Buttons, and more (put in components folder)
import SwiftUI
import Firebase

@main
struct AuthFitApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure() // configure Firebase
    } // when app launches
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
