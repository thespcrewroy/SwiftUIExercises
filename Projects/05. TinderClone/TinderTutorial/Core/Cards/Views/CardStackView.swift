//
//  Title: CardStackView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Card stack view for the app. Contains the card stack 
//  and swipe action buttons.
//
//  Variable Type Descriptions:
//  - EnvironmentObject: a property wrapper that allows objects to be shared amongst multiple views.
//  - State: a property wrapper that allows a view to store and manage its own state.
//  - StateObject: a property wrapper that creates an Observable Object with a lifecycle that is scoped to the view.
//  - Observable Object: a class that can be observed by a view and notifies the view when the object changes.
//

import SwiftUI

/**
    A view that represents a stack of cards in a Tinder-like interface.

    @param matchManager: The match manager.
    @param showMatchView: A boolean that indicates whether to show the match view.
    @param viewModel: The view model for the cards.
*/
struct CardStackView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @State private var showMatchView = false
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            ZStack { // stack the following vstack above the match view
                VStack(spacing: 16) { // stack the cards above the swipe action buttons
                    ZStack { // stack the cards on top of each other
                        ForEach(viewModel.cardModels) { card in // for each card in the view model
                            CardView(viewModel: viewModel, model: card) // load the cardview for it
                        } /// ForEach
                    } /// ZStack
                    
                    if !viewModel.cardModels.isEmpty { // if there are cards left in the view model
                        SwipeActionButtonsView(viewModel: viewModel) // load the swipe action buttons
                    } /// if
                } /// VStack
                .blur(radius: showMatchView ? 20 : 0) // blur the cards if there is a match
                if showMatchView { // if there is a match
                    UserMatchView(show: $showMatchView) // load the user match view
                } /// if
            } /// ZStack
            .animation(.easeInOut, value: showMatchView) // add animation to load the match view
            .onReceive(matchManager.$matchedUser) { user in // when a user is matched
                showMatchView = user != nil // load the match view for that user
            } /// onReceive
            .toolbar { // add a toolbar to the view
                ToolbarItem(placement: .topBarLeading) { // place the toolbar at the top
                    Image(.tinderLogo) // load the tinder logo
                        .resizable() // resize the image
                        .scaledToFit() // fit the image to the frame
                        .frame(width: 80) // set the frame size
                } /// ToolbarItem
            } /// toolbar
        } /// NavigationStack
    } /// body
} /// CardStackView

#Preview { // preview the card stack view
    CardStackView() // load the card stack view
        .environmentObject(MatchManager()) // pass the match manager to the card stack view
} /// Preview
