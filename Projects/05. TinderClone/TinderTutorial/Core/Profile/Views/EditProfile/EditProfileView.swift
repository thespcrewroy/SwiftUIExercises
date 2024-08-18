//
//  Title: EditProfileView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: View to edit user profile.
//
//  Variable Type Descriptions:
//  - Environment: A property wrapper type that reads the value of a key path from the environment.
//  - State: A property wrapper type that can read and write a value managed by the view.
//  - User: A data structure representing a user.
//

import SwiftUI

/**
    View to edit user profile.

    @param dismiss: A property wrapper type that dismisses the view.
    @param bio: The user's bio.
    @param occupation: The user's occupation.
    @param user: The user.
*/
struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var bio = ""
    @State private var occupation = "Football Player"
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView { // create a scroll view
                ProfileImageGridView(user: user) // create a profile image grid view with user data
                    .padding() // add padding
                
                VStack(spacing: 24) { // stack the text fields vertically
                    VStack(alignment: .leading) { // stack the about me text and text field vertically
                        Text("ABOUT ME") // add about me text
                            .font(.subheadline) // set font size
                            .fontWeight(.bold) // set font weight
                            .padding(.leading) // add leading padding
                        
                        TextField("Add your bio", text: $bio, axis: .vertical) // add text field for bio
                            .padding() // add padding
                            .frame(height: 64, alignment: .top) // set frame height
                            .background(Color(.secondarySystemBackground)) // set background color
                            .font(.subheadline) // set font size
                    } /// VStack
                    
                    VStack(alignment: .leading) { // stack the occupation text and text field vertically
                        Text("OCCUPATION") // add occupation text
                            .font(.subheadline) // set font size
                            .fontWeight(.bold) // set font weight
                            .padding(.leading) // add leading padding
                        
                        HStack { // stack the occupation icon and text horizontally
                            Image(systemName: "book") // add book icon
                            Text("Occupation") // add occupation text

                            Spacer() // add spacer
                            
                            Text(occupation) // add occupation
                                .font(.footnote) // set font size
                        } /// HStack
                        .padding() // add padding
                        .background(Color(.secondarySystemBackground)) // set background color
                        .font(.subheadline) // set font size
                    } /// VStack
                    
                    VStack(alignment: .leading) { // stack the
                        Text("GENDER") // add gender text
                            .font(.subheadline) // set font size
                            .fontWeight(.bold) // set font weight
                            .padding(.leading) // add leading padding
                        
                        HStack { // stack text and icon horizontally
                            Text("Man") // add gender text
                            
                            Spacer() // add spacer
                            
                            Image(systemName: "chevron.right") // add chevron icon
                                .imageScale(.small) // set image scale
                        } /// HStack
                        .padding() // add padding
                        .background(Color(.secondarySystemBackground)) // set background color
                        .font(.subheadline) // set font size
                    } /// VStack
                    
                    VStack(alignment: .leading) { // stack the text and icon vertically
                        Text("SEXUAL ORIENTATION") // add sexual orientation text
                            .font(.subheadline) // set font size
                            .fontWeight(.bold) // set font weight
                            .padding(.leading) // add leading padding
                        
                        HStack { // stack the text and icon horizontally
                            Text("Straight") // add sexual orientation text
                            
                            Spacer() // add spacer
                            
                            Image(systemName: "chevron.right") // add chevron icon
                                .imageScale(.small) // set image scale
                        } /// HStack
                        .padding() // add padding
                        .background(Color(.secondarySystemBackground)) // set background color
                        .font(.subheadline) // set font size
                    } /// VStack
                } /// VStack
            } /// ScrollView
            .scrollIndicators(.hidden) // hide the scroll indicators
            .navigationTitle("Edit Profile") // set the navigation title
            .navigationBarTitleDisplayMode(.inline) // set the navigation title display mode
            .toolbar { // add toolbar items
                ToolbarItem(placement: .topBarLeading) { // add cancel button
                    Button("Cancel") { // cancel button
                        dismiss() // dismiss the view
                    } /// Button
                } /// ToolbarItem
                
                ToolbarItem(placement: .topBarTrailing) { // add done button
                    Button("Done") { // done button
                        dismiss() // dismiss the view
                    } /// Button
                    .fontWeight(.semibold) // set font weight
                } /// ToolbarItem
            } /// toolbar
        } /// NavigationStack
    } /// body
}

#Preview { // preview the edit profile view
    EditProfileView(user: MockData.users[1]) // load the edit profile view
} /// Preview