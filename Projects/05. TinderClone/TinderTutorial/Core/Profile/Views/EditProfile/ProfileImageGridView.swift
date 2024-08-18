//
//  Title: ProfileImageGridView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: View to display profile images in a grid.
//
//  Variable Type Descriptions:
//  - User: A data structure representing a user.
//

import SwiftUI

/**
    View to display profile images in a grid.

    @param user: The user whose profile images are to be displayed.
*/
struct ProfileImageGridView: View {
    
    let user: User
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) { // create a lazy vertical grid
            ForEach(0 ..< 6) { index in // iterate through the user's profile images
                if index < user.profileImageURLs.count { // if the index is within the range of profile images
                    Image(user.profileImageURLs[index]) // load the profile image
                        .resizable() // resize the image adaptive to the frame
                        .scaledToFill() // fill the frame with the image
                        .frame(width: imageWidth, height: imageHeight) // set the frame size
                        .clipShape(RoundedRectangle(cornerRadius: 10)) // round edges
                } else { // if the index is out of range
                    ZStack(alignment: .bottomTrailing) { // stack the image on top of the add icon
                        RoundedRectangle(cornerRadius: 10) // add a rounded rectangle shape
                            .fill(Color(.secondarySystemBackground)) // fill the rectangle with secondary system background color
                            .frame(width: imageWidth, height: imageHeight) // set the frame size
                        
                        Image(systemName: "plus.circle.fill") // load the plus icon
                            .imageScale(.large) // set the image scale
                            .foregroundStyle(Color(.systemPink)) // set the foreground color
                            .offset(x: 4, y: 4) // set the offset
                    } /// ZStack
                } /// else
            } /// ForEach
        } /// LazyVGrid
    } /// body
} /// ProfileImageGridView

/**
    Extension to provide computed properties for the ProfileImageGridView.
*/
private extension ProfileImageGridView { 
    var columns: [GridItem] { // create three grid columns
        [
            .init(.flexible()),
            .init(.flexible()),
            .init(.flexible())
        ]
    } /// columns
    
    var imageWidth: CGFloat { // get the image width
        return 110 // return image width
    } /// imageWidth
    
    var imageHeight: CGFloat { // get the image height
        return 160 // return image height
    } /// imageHeight
}

#Preview { // preview the profile image grid view
    ProfileImageGridView(user: MockData.users[1]) // load the profile image grid view
} /// Preview
