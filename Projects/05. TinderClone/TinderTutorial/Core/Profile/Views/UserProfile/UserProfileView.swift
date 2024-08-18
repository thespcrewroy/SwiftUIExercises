//
//  Title: UserProfileView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: View to display user profile.
//
//  Variable Type Descriptions:
//  - Environment: A property wrapper type that reads the value of a key path from the environment.
//  - State: A property wrapper type that can read and write a value managed by the view.
//  - User: A data structure representing a user.
//

import SwiftUI

/**
    View to display user profile.

    @param dismiss: A property wrapper type that dismisses the view.
    @param currentImageIndex: The current image index.
    @param user: The user.
*/
struct UserProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var currentImageIndex = 0
    let user: User
    
    var body: some View {
        VStack { // stack the hstack above the scroll view
            HStack { // stack the text and button horizontally
                Text(user.fullname) // add user name
                    .font(.title2) // set font size
                    .fontWeight(.semibold) // set font weight
                
                Text("\(user.age)") // add user age
                    .font(.title2) // set font size
                
                Spacer() // add spacer
                
                Button { // button to dismiss the view
                    dismiss() // dismiss the view
                } label: { // label for the button
                    Image(systemName:"arrow.down.circle.fill") // add down arrow image
                        .imageScale(.large) // set image scale
                        .fontWeight(.bold) // set font weight
                        .foregroundStyle(.pink) // set foreground color
                } /// Button
            } /// HStack
            .padding(.horizontal) // add horizontal padding
            
            ScrollView { // create a scroll view
                VStack { // stack the zstack above the vstack
                    ZStack(alignment: .top) { // stack the image on top of the card image indicator
                        Image(user.profileImageURLs[currentImageIndex]) // load the placeholder images
                            .resizable() // resize the image adaptive to the frame
                            .scaledToFill() // fill the frame with the image
                            .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                            .clipShape(RoundedRectangle(cornerRadius: 10)) // round edges
                            .overlay { // overlay the image scrolling functionality
                                ImageScrollingOverlay(currentImageIndex: $currentImageIndex,
                                                      imageCount: user.profileImageURLs.count
                                ) // load the image scrolling overlay
                            } /// overlay
                        
                        CardImageIndicatorView(currentImageIndex: currentImageIndex,
                                               imageCount: user.profileImageURLs.count
                        ) // load the image indicator
                    } /// ZStack
                    
                    VStack(alignment: .leading, spacing: 12) { // stack the views vertically
                        Text("About Me") // add about me text
                            .fontWeight(.semibold) // set font weight
                        
                        Text("Some text bio for me...") // add user bio
                    } /// VStack
                    .frame(maxWidth: .infinity, alignment: .leading) // set the frame width to infinity
                    .padding() // add padding around the text
                    .background(Color(.secondarySystemBackground)) // set the background color
                    .font(.subheadline) // set the font size
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // round edges
                } /// VStack
                
                VStack(alignment: .leading, spacing: 12) { // stack the views vertically
                    Text("Essentials") // add essentials text
                        .fontWeight(.semibold) // set font weight
                    
                    HStack { // stack the image and text horizontally
                        Image(systemName: "person") // add person icon
                        Text("Male") // add gender
                        Spacer() // push the text to the right
                    } /// HStack
                    .font(.subheadline) // set font size
                    
                    HStack { // stack the image and text horizontally
                        Image(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
                        Text("Straight") // add orientation
                        Spacer() // push the text to the right
                    } /// HStack
                    .font(.subheadline) // set font size
                    
                    HStack { // stack the image and text horizontally
                        Image(systemName: "book") // add book icon
                        Text("Actress") // add profession
                        Spacer() // push the text to the right
                    } /// HStack
                } /// VStack
                .padding() // add padding around the text
                .background(Color(.secondarySystemBackground)) // set the background color
                .font(.subheadline) // set the font size
                .clipShape(RoundedRectangle(cornerRadius: 10)) // round edges
            } /// ScrollView
        } /// VStack
    } /// body
} /// UserProfileView

#Preview { // preview the user profile view
    UserProfileView(user: MockData.users[0]) // load the user profile view
} /// Preview
