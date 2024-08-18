//
//  AuthViewModel.swift
//  AuthFit
//
//  Responsible for having all the functionality for authenticating the user:
//  * Making network calls to sign the user in
//  * Send updates to myView to present the correct view when sign in goes through successfully
//  * Handle errors if user tries to sign in with an invalid email
//  * Update the UI
//  * Sending notifications to the UI when we need to update it
//
//  Created by Swapnil Roy on 3/18/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestoreSwift

/// A protocol that defines the requirements for an authentication form.
protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get } // determine the logic to tell us if form is valid
} // implement authentication protocol/interface everywhere we have a form

/**
 The `AuthViewModel` conforms to the `ObservableObject` protocol, allowing it 
 to be observed by SwiftUI views.
 */
@MainActor // publish all UI updates on the main thread
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?  // determines if a firebaseauth user is logged-in
    @Published var currentUser: User?   // our user
    
    init() {
        self.userSession = Auth.auth().currentUser // if user is logged in, cache that information (userSession != nil)
        
        Task {
            await fetchUser()
        } // fetch user data
    } // unless we sign out, keep us logged in
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password) // store signIn info in 'result'
            self.userSession = result.user // set session to currentUser's information
            await fetchUser() // fetch user data from Firebase after signing in
        } catch {
            print("DEBUG: failed to login with error \(error.localizedDescription)")
        }
    }
    
    /**
     Creates a user with the specified email, password, and full name.
     
     - Parameters:
        - email: The email address of the user.
        - password: The password for the user.
        - fullName: The full name of the user.
     
     - Throws: An error if the user creation fails.
     */
    func createUser(withEmail email: String, password: String, fullName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password) // Returns and stores auth data
            self.userSession = result.user // set userSession property to user object if we get a successful result back
            let user = User(id: result.user.uid,
                            fullName: fullName,
                            email: email) // create our user object using id from firebase, fullName and email from form
            let encodedUser = try Firestore.Encoder().encode(user) // encodes our user object to json code with Codable protocol to upload to Firebase
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser) // upload data to Firestore
            await fetchUser() // fetch data uploaded to Firebase so it can be displayed on the screen
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        } // can potentially throw an error if do block goes wrong
    } // Async Throws: utilize asyncronous code in a syncronous way without completion blocks/handlers
    
    /**
     Signs out the user from the authentication system.
     */
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session + takes us back to login screen
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        } // catch an error on sign out
    } // sign out on client side + logout on backend
    
    /**
        Deletes the user account.
        This function is responsible for deleting the user account from the system. 
        It performs the necessary operations to remove all associated data and resources.
        Once the account is deleted, all data associated with the account will be lost 
        and cannot be recovered.

        - TODO: Before calling this function, make sure to prompt the 
            user for confirmation to prevent accidental deletion. Make sure to wipe
            data from Firestore so user cannot login again.

        - Throws: An error if the deletion process fails.
    */
    func deleteAccount() {
        func deleteAccount() async throws {
            do {
                guard let user = Auth.auth().currentUser else {
                    throw NSError(domain: "AuthViewModel", code: 0, userInfo: [NSLocalizedDescriptionKey: "User not found"])
                }
                
                try await user.delete() // Delete the user account
                
                // Clean up the user session and current user data
                self.userSession = nil
                self.currentUser = nil
            } catch {
                print("DEBUG: Failed to delete account with error \(error.localizedDescription)")
                throw error
            }
        }
    }
    
    /**
     Fetches the user information from Firebase and sets the `currentUser` property 
     of the `AuthViewModel` to the fetched user data. This function requires the 
     user to be logged in. If the user is not logged in, the function will
     return without making an API call. The `currentUser` property will be 
     set to `nil` if the user data cannot be fetched or if there is an error 
     while mapping the data to the `User` object.

     - Throws: An error if there is an issue while fetching the user 
     data or mapping it to the `User` object.
     */
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return } // get id if user is logged in, else hit guard statement to not waste API call
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return } // return authentication info
        self.currentUser = try? snapshot.data(as: User.self) // set currentUser to authentication info that is returned
    } // map information from Firebase into user object to display to ProfileView
    
} // Observable Protocol: view can observe changes to AuthViewModel
