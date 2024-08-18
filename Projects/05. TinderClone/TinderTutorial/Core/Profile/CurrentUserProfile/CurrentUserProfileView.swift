//
//  Title: CurrentUserProfileView.swift
//  Author: Swapnil Roy
//
//  Created by Swapnil Roy on 5/2/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @State private var showEditProfile = false
    let user: User
    
    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        showEditProfile.toggle()
                    }
                
                // account info
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullname)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@gmail.com")
                    }
                }
                
                // legal
                Section("legal") {
                    Text("Terms of service")
                }
                
                // logout/delete
                Section("Logout") {
                    Button("Logout") {
                        print("DEBUG: Logout here...")
                    }
                    .foregroundStyle(.red)
                }
                    
                Section("Delete") {
                    Button("Delete Account") {
                        print("DEBUG: Delete account here...")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $showEditProfile) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
