//
//  ProfileView.swift
//  AuthFit
//
//  Responsible for:
//  * Displaying the user's profile information
//  * Displaying the user's email and full name
//  * Displaying the user's profile icon
//  * Displaying the user's initials
//
//  Created by Swapnil Roy on 3/13/24.
//

import SwiftUI

/// A view that displays the user's profile information.
struct ProfileView: View {
    /**
     A view that displays the user's profile information and provides 
     options for managing the account.

     - Parameters:
        - viewModel: An instance of `AuthViewModel` that handles 
          authentication and user data.
     */
    @EnvironmentObject var viewModel: AuthViewModel // casts an AuthViewModel instance

    var body: some View {
        if let user = viewModel.currentUser {
            List {
                /**
                 A section displaying the user's profile information.
                 */
                Section {
                    HStack {
                        // Profile Icon
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(Circle())
                            .padding(.trailing, 10)
                        
                        // Profile Text
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        } // VStack
                    } // HStack
                } // Section
                
                Section("General") {
                    HStack {
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    } // HStack
                } // Section
                
                Section("Account") {
                    Button(action: {
                        viewModel.signOut() // call the signOut method in AuthViewModel
                    }, label: {
                        Text("Sign Out")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    })
                    
                    Button(action: {
                        viewModel.deleteAccount() // call the deleteAccount method in AuthViewModel
                        viewModel.signOut() // call the signOut method in AuthViewModel
                    }, label: {
                        Text("Delete Account")
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .fontWeight(.bold)
                    })
                } // Section
            } // List
        } // if the user is present, the profileView will render
    } // body
}

#Preview {
    ProfileView()
} // Preview
