//
//  Title: UserInfoView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/1/24
//
//  Purpose: View to display user information and bio.
//
//  Variable Type Descriptions:
//  - Binding: A type that can read and write a value owned by another source of truth.
//  - User: A struct representing a user.
//

import SwiftUI

/**
    A view to display user information and bio.
 
    @showProfileModal: A binding to show the profile modal.
    @user: The user object.
*/
struct UserInfoView: View {
    
    @Binding var showProfileModal: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) { // stack the user info vertically
            HStack { // stack the user name and age horizontally
                Text(user.fullname) // add user name
                    .font(.title) // set font size
                    .fontWeight(.heavy) // set font weight
                
                Text("\(user.age)") // add user age
                    .font(.title) // set font size
                    .fontWeight(.semibold) // set font weight
                
                Spacer() // add spacer to push the button to the right
                
                Button { // button to show profile modal
                    showProfileModal.toggle() // toggle the profile modal
                } label: { // label for the button
                    Image(systemName: "arrow.up.circle") // add button image
                        .fontWeight(.bold) // set font weight of button image
                        .imageScale(.large) // set image scale of button image
                } /// Button
            } /// HStack
            Text("Some test bio for now...") // add user bio
                .font(.subheadline) // set font size
                .lineLimit(2) // limit the number of lines
        } /// VStack
        .foregroundStyle(.white) // make text white
        .padding() // add padding on all sides
        .background( // add background to the userinfoview
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        ) // blend the userinfoview to the bottom of the card
    } /// body
} /// UserInfoView

#Preview { // preview the user info view
    UserInfoView(showProfileModal: .constant(false), user: MockData.users[1]) // load the user info view
} /// Preview
