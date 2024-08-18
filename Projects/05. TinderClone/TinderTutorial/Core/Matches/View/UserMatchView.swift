//
//  Title: UserMatchView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: View to display user match.
//
//  Variable Type Descriptions:
//  - Binding: A property wrapper type that can read and write a value owned by a source of truth.
//  - EnvironmentObject: A property wrapper type that subscribes to an observable object and updates the view when the object changes.
//

import SwiftUI

/**
    A view to display user match.
 
    @show: A binding to show the user match view.
    @matchManager: The match manager object.
*/
struct UserMatchView: View {
    
    @Binding var show: Bool
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        ZStack { // stack the following vstack above the match view
            Rectangle() // add a rectangle to the view
                .fill(.black.opacity(0.75)) // fill the rectangle with black color
                .ignoresSafeArea() // ignore the safe area
            
            VStack(spacing: 120) { // stack the following views vertically
                VStack { // stack the views vertically
                    Image("match") // load the match image
                        .resizable() // resize the image
                        .aspectRatio(contentMode: .fit) // fit the image to the frame
                        .padding() // add padding around the image
                    
                    if let matchedUser = matchManager.matchedUser { // if there is a matched user
                        Text("You and \(matchedUser.fullname) have liked each other.") // display the match message
                            .foregroundStyle(.white) // set the text color
                    } /// if
                } /// VStack
                
                HStack(spacing: 16) { // stack the views horizontally
                    Image(MockData.users[0].profileImageURLs[0]) // load the first user image
                        .resizable() // resize the image
                        .scaledToFill() // fill the frame with the image
                        .frame(width: 150, height: 150) // set the frame size
                        .clipShape(Circle()) // clip the image to a circle
                        .overlay { // overlay the image with a circle
                            Circle() // add a circle shape
                                .stroke(.white, lineWidth: 2) // stroke the circle with white color
                                .shadow(radius: 4) // add shadow to the circle
                        } /// overlay
                    
                    if let matchedUser = matchManager.matchedUser { // if there is a matched user
                        Image(matchedUser.profileImageURLs[1]) // load the second user image
                            .resizable() // resize the image
                            .scaledToFill() // fill the frame with the image
                            .frame(width: 150, height: 150) // set the frame size
                            .clipShape(Circle()) // clip the image to a circle
                            .overlay { // overlay the image with a circle
                                Circle() // add a circle shape
                                    .stroke(.white, lineWidth: 2) // stroke the circle with white color
                                    .shadow(radius: 4) // add shadow to the circle
                            } /// overlay
                    } /// if
                } /// HStack
                
                VStack(spacing: 16) { // stack the views vertically
                    Button("Send Message") { // button to send message
                        show.toggle() // toggle the show state
                    } /// Button
                    .font(.subheadline) // set the font size
                    .fontWeight(.semibold) // set the font weight
                    .foregroundStyle(.white) // set the text color
                    .frame(width: 350, height: 44) // set the frame size
                    .background(.pink) // set the background color
                    .clipShape(Capsule()) // clip the button to a capsule
                    
                    Button("Keep Swiping") { // button to keep swiping
                        show.toggle() // toggle the show state
                    } /// Button
                    .font(.subheadline) // set the font size
                    .fontWeight(.semibold) // set the font weight
                    .foregroundStyle(.white) // set the text color
                    .frame(width: 350, height: 44) // set the frame size
                    .background(.clear) // set the background color
                    .clipShape(Capsule()) // clip the button to a capsule
                    .overlay { // overlay the button
                        Capsule() // add a capsule shape
                            .stroke(.white, lineWidth: 1) // stroke the capsule with white color
                            .shadow(radius: 4) // add shadow to the capsule
                    } /// overlay
                } /// VStack
            } /// VStack
        } /// ZStack
    } /// body
} /// UserMatchView

#Preview { // preview the user match view
    UserMatchView(show: .constant(true)) // load the user match view
        .environmentObject(MatchManager()) // pass the match manager to the user match view
} /// Preview
