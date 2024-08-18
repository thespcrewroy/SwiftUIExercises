//
//  Title: CurrentUserProfileView.swift
//  Author: Swapnil Roy
//
//  Description: View for the current user's profile.
//
//  Variable Type Description:
//  - User - a data structure representing a user.
//  - State - a property wrapper type that can read and write a value managed by the view.
//

import SwiftUI

/**
    View for the current user's profile.

    @param showEditProfile: A boolean to show the edit profile view.
    @param user: The user.
*/
struct CurrentUserProfileView: View {
    
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        NavigationStack { // create a navigation stack
            List { // create a list
                CurrentUserProfileHeaderView(user: user) // header view
                    .onTapGesture { // when tapped
                        showEditProfile.toggle() // toggle the edit profile view
                    } // onTapGesture

                Section("Account Information") { // account info section
                    HStack { // stack the name and user name horizontally
                        Text("Name") // add name label
                        
                        Spacer() // add spacer
                        
                        Text(user.fullname) // add user name
                    } // HStack
                    
                    HStack { // stack the email and user email horizontally
                        Text("Email") // add email label
                        
                        Spacer() // add spacer
                        
                        Text("test@gmail.com") // add user email
                    } // HStack
                } // Section
                
                Section("legal") { // legal section
                    Text("Terms of service") // add terms of service text
                } // Section
                
                Section("Logout") { // logout section
                    Button("Logout") { // logout button
                        print("DEBUG: Logout here...") // print logout message
                    } // Button
                    .foregroundStyle(.red) // set button color
                } // Section
                    
                Section("Delete") { // delete section
                    Button("Delete Account") { // delete account button
                        print("DEBUG: Delete account here...") // print delete account message
                    } // Button
                    .foregroundStyle(.red) // set button color
                } // Section
            } // List
            .navigationTitle("Profile") // set navigation title
            .navigationBarTitleDisplayMode(.inline) // set navigation title display mode
            .fullScreenCover(isPresented: $showEditProfile) { // show edit profile view
                EditProfileView(user: user) // load edit profile view
            } /// fullScreenCover
        } /// NavigationStack
    } /// body
}

#Preview { // preview the current user profile view
    CurrentUserProfileView(user: MockData.users[1]) // load the current user profile view
} /// Preview
