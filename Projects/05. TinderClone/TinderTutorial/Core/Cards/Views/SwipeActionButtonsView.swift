//
//  Title: SwipeAction.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Swipe action buttons for the card stack view.
//
//  //  Variable Type Descriptions:
//  - ObservedObject: wraps to an observable object and invalidates a view whenever the observable object changes.
//

import SwiftUI

/**
    A view to display the swipe action buttons for the card stack view.

    @viewModel: The view model for the cards.
*/
struct SwipeActionButtonsView: View {
    
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
        HStack(spacing: 32) { // stack the swipe action buttons side by side
            Button { // button to reject the card
                viewModel.buttonSwipeAction = .reject // set the swipe action to reject
            } label: { // label for the button
                Image(systemName: "xmark") // load the xmark icon
                    .fontWeight(.heavy) // set the font weight
                    .foregroundStyle(.red) // set the foreground color
                    .background { // add a background to the icon
                        Circle() // add a circle shape
                            .fill(.white) // fill the circle with white color
                            .frame(width: 48, height: 48) // set the frame size
                            .shadow(radius: 6) // add shadow to the circle
                    } /// background
            } /// label
            .frame(width: 40, height: 48) // set the frame size
            
            Button { // button to like the card
                viewModel.buttonSwipeAction = .like // set the swipe action to like
            } label: { // label for the button
                Image(systemName: "heart.fill") // load the heart icon
                    .fontWeight(.heavy) // set the font weight
                    .foregroundStyle(.green) // set the foreground color
                    .background { // add a background to the icon
                        Circle() // add a circle shape
                            .fill(.white) // fill the circle with white color
                            .frame(width: 48, height: 48) // set the frame size
                            .shadow(radius: 6) // add shadow to the circle
                    } /// background
            } /// label
            .frame(width: 48, height: 48) // set the frame size
        } /// HStack
    } /// body
} /// SwipeActionButtonsView

#Preview { // preview the swipe action buttons view
    SwipeActionButtonsView(viewModel: CardsViewModel(service: CardService())) // load the swipe action buttons view
} /// Preview
