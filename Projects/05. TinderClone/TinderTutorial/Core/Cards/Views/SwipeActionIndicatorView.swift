//
//  Title: SwipeActionIndicatorView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/1/24
//
//  Description: Swipe action indicator view to show the like and nope buttons
//
//  //  Variable Type Descriptions:
//  - Binding: A reference to a value, used to keep the data in sync between two views.
//

import SwiftUI

/**
    A view that represents the swipe action indicator view.
 
    @param xOffset: The x-offset of the card.
*/
struct SwipeActionIndicatorView: View {
    
    @Binding var xOffset: CGFloat
    
    var body: some View {
        HStack { // stack the like and nope signs next to each other
            Text("LIKE") // add like text
                .font(.title) // set font size
                .fontWeight(.heavy) // set font weight
                .foregroundStyle(.green) // set text color
                .overlay { // add border to the text
                    RoundedRectangle(cornerRadius: 4) // round the edges
                        .stroke(.green, lineWidth: 2) // set border color and width
                        .frame(width: 100, height: 40) // set frame size
                } /// overlay
                .rotationEffect(.degrees(-45)) // rotate the text
                .opacity(Double(xOffset / SizeConstants.screenCutoff)) // slowly fade in as xOffset increases
            
            Spacer() // add spacer to push the nope button to the right
            
            Text("NOPE") // add nope text
                .font(.title) // set font size
                .fontWeight(.heavy) // set font weight
                .foregroundStyle(.red) // set text color
                .overlay { // add border to the text
                    RoundedRectangle(cornerRadius: 4) // round the edges
                        .stroke(.red, lineWidth: 2) // set border color and width
                        .frame(width: 100, height: 40) // set frame size
                } /// overlay
                .rotationEffect(.degrees(45)) // rotate the text
                .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1) // slowly fade in as xOffset decreases
        } /// HStack
        .padding(40) // add padding on all sides
    } /// body
} /// SwipeActionIndicatorView

#Preview { // preview the swipe action indicator view
    SwipeActionIndicatorView(xOffset: .constant(20)) // load the swipe action indicator view
} /// Preview
