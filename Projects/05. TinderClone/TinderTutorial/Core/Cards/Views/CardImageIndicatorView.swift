//
//  Title: CardImageIndicatorView.swift
//  Author: Swapnil Roy
//  Date: 5/2/24
//
//  Purpose: A view to display the image indicators for the card images.
//

import SwiftUI

/**
    A view to display the image indicators for the card images.

    @currentImageIndex: The current image index.
    @imageCount: The total number of images.
*/
struct CardImageIndicatorView: View {
    
    let currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack { // stack the image indicators
            ForEach(0 ..< imageCount, id: \.self) { index in // for each image in the total count
                Capsule() /// add capsule shape
                    .foregroundStyle(currentImageIndex == index ? .white : .gray) // color the capsule
                    .frame(width: 100, height: 4) // set the frame size
                    .padding(.top, 6) // add padding on top
            } /// ForEach
        } /// HStack
    } /// body
} /// CardImageIndicatorView

/**
    Extension to provide some helper methods.

    @imageIndicatorWidth: The width of the image indicator.
*/
private extension CardImageIndicatorView { // extension
    var imageIndicatorWidth : CGFloat { // get the image indicator width
        return SizeConstants.cardWidth / CGFloat(imageCount) - 28 // return image indicator width
    } /// imageIndicatorWidth
} /// extension

#Preview { // preview the card image indicator view
    CardImageIndicatorView(currentImageIndex: 1, imageCount: 4) // load the card image indicator view
        .preferredColorScheme(.dark) // set the color scheme to dark
} /// Preview
