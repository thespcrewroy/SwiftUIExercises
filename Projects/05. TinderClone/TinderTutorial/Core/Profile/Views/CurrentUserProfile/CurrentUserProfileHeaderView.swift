//
//  Title: CurrentUserHeaderProfileView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Header view for the current user profile.
//

import SwiftUI

/**
    Header view for the current user profile.

    @user: The user model.
*/
struct CurrentUserProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack { // stack following zstack on top of text
            ZStack(alignment: .topTrailing) { // stack profile image above edit icon
                Image(user.profileImageURLs[0]) // load profile image
                    .resizable() // resize the image
                    .scaledToFill() // fill the frame with the image
                    .frame(width: 120, height: 120) // set the frame size
                    .clipShape(Circle()) // clip the image to a circle
                    .background { // add a background to the image
                        Circle() // add a circle shape
                            .fill(Color(.systemGray6)) // fill the circle with gray color
                            .frame(width: 120, height: 120) // set the frame size
                            .shadow(radius: 10) // add shadow to the circle
                    } /// background
                
                Image(systemName: "pencil") // load the pencil icon
                    .imageScale(.small) // set the image scale
                    .foregroundStyle(.gray) // set the foreground color
                    .background { // add a background to the icon
                        Circle() // add a circle shape
                            .fill(.white) // fill the circle with white color
                            .frame(width: 32, height: 32) // set the frame size
                    } /// background
            } /// ZStack
            Text("\(user.fullname), \(user.age)") // display user name and age
                .font(.title2) // set font size
                .fontWeight(.light) // set font weight
        } /// VStack
        .frame(maxWidth: .infinity) // set the frame width to infinity
        .frame(height: 240) // set the frame height
    } /// body
} /// CurrentUserProfileHeaderView

#Preview { // preview the current user profile header view
    CurrentUserProfileHeaderView(user: MockData.users[0]) // load the current user profile header view
} /// Preview
