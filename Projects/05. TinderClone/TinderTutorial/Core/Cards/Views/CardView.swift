//
//  Title: CardView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Card view that displays user information and allows for swiping functionality.
//
//  Variable Type Definitions:
//  - EnvironmentObject: a property wrapper that allows objects to be shared amongst multiple views.
//  - State: a property wrapper that allows a view to store and manage its own state.
//  - StateObject: a property wrapper that creates an Observable Object with a lifecycle that is scoped to the view.
//  - Observable Object: a class that can be observed by a view and notifies the view when the object changes.
//  - let: a constant value that is immutable.
//

import SwiftUI

/**
    A view that represents a card in a Tinder-like interface.
    
    @param matchManager: The match manager.
    @param viewModel: The view model for the cards.
    @param xOffset: The x-offset of the card.
    @param degrees: The rotation of the card.
    @param currentImageIndex: The index of the current image.
    @param showProfileModal: A boolean that indicates whether to show the profile modal.
    @param model: The card model.
*/
struct CardView: View {
    
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal = false
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) { // stack the following zstack top user info view
            ZStack(alignment: .top) { // stack the image on top of the image indicator and swipe action indicator
                Image(user.profileImageURLs[currentImageIndex]) // load the image
                    .resizable() // resize the image adaptive to the frame
                    .scaledToFill() // fill the frame with the image
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight) // set the frame size
                    .clipShape(RoundedRectangle(cornerRadius: 10)) // round edges
                    .overlay { // overlay the image scrolling functionality
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    } /// overlay
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount) // load img indicator
                SwipeActionIndicatorView(xOffset: $xOffset) // load the swipe action indicator
            } /// ZStack
            UserInfoView(showProfileModal: $showProfileModal, user: user) // load the user info view
        } /// ZStack
        .fullScreenCover(isPresented: $showProfileModal) { // show the profile modal
            UserProfileView(user: user) // load the user profile view
        } /// fullScreenCover
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in // when swipe action is received
            onReceiveSwipeAction(action) // perform the swipe action
        }) /// onReceive
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight) // set the frame size
        .clipShape(RoundedRectangle(cornerRadius: 10)) // image is rounded rectangle
        .offset(x: xOffset) // offset property changes based off @state xOffset
        .rotationEffect(.degrees(degrees)) // rotate property changed off @state degrees
        .animation(.snappy, value: xOffset) // add snappy animation to the card when swiping
        .gesture( // gesture to drag the card
            DragGesture() // drag gesture
                .onChanged(onDragChanged) // when dragging, execute onDragChanged
                .onEnded(onDragEnded) // when drag ends, execute onDragEnded
        ) /// gesture
    } /// body
} /// CardView

/**
    Extension to provide some helper methods.
    - return the user from the model
    - get the image count
*/
private extension CardView {
    var user: User { // get the user from the model
        return model.user // return the user
    } /// user
    
    var imageCount: Int { // get the image count
        return user.profileImageURLs.count // return the count of the user's images
    } /// imageCount
} /// extension

/**
    Extension to provide some helper methods.
    - return to center: reset xOffset and degrees
    - swipe right: swipes the card to the right all the way off the screen
    - swipe left: swipes the card to the left all the way off the screen
    - on receive swipe action: perform swipe action on topmost card
*/
private extension CardView { /// extension
    /**
        Function that resets the xOffset and degrees when the card is returned to the center.
    */
    func returnToCenter() { 
        xOffset = 0 // reset xOffset
        degrees = 0 // reset degrees
    } /// returnToCenter
    
    /**
        Function that swipes the card to the right all the way off the screen.
    */
    func swipeRight() {
        withAnimation { // animate the swipe
            xOffset = 500 // move image offscreen to the right
            degrees = 12 // rotate the image
        } completion: { // when animation completes
            viewModel.removeCard(model) // remove the card from the view model
            matchManager.checkForMatch(withUser: user) // check for a match with the user
        } /// completion
    } /// swipeRight
    
    /**
        Function that swipes the card to the left all the way off the screen.
    */
    func swipeLeft() {
        withAnimation { // animate the swipe
            xOffset = -500 // move image offscreen to the left
            degrees = -12 // rotate the image
        } completion: { // when animation completes
            viewModel.removeCard(model) // remove the card from the view model
        } /// completion
    } /// swipeLeft
    
    /**
        Function that performs the swipe action on the topmost card.
        
        @param action: The swipe action to perform.
    */
    func onReceiveSwipeAction(_ action: SwipeAction?) { 
        guard let action else { // if action is nil
            return // return (exit from function)
        } /// guard
        let topCard = viewModel.cardModels.last // get the top card
        if topCard == model { // if the top card is the current card
            switch action { // switch on the swipe action
            case .reject: // if reject
                swipeLeft() // swipe left
            case .like: // if like
                swipeRight() // swipe right
            } /// switch
        } /// if
    } /// onReceiveSwipeAction
} /// extension

/**
    Extension to provide some helper methods.
    - on drag changed: change xOffset and degrees when person drags the card
    - on drag ended: snap the card back in place when person stops dragging it
*/
private extension CardView {
    /**
        Function that changes the xOffset and degrees when the person drags the card.
        
        @param value: The value of the drag gesture.
    */
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width // update xOffset
        degrees = Double(value.translation.width / 25) // update degrees
    } /// onDragChanged

    /**
        Function that snaps the card back in place when the person stops dragging it.
        
        @param value: The value of the drag gesture.
    */
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width // get the width of the drag
        if abs(width) <= abs(SizeConstants.screenCutoff) { // if the width of drag <= screen cutoff
            returnToCenter() // return to center
            return // return (exit from function)
        } /// if
        if width >= SizeConstants.screenCutoff { // if width of drag >= screen cutoff
            swipeRight() // swipe right
        } else { // if widthof drag < screen cutoff
            swipeLeft() // swipe left
        } /// if
    } /// onDragEnded
} /// CardView

#Preview { // preview the card view
    CardView( // load the card view
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel(user: MockData.users[1])
    ) /// CardView
} /// Preview
