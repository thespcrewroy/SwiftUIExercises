//
//  Title: ImageScrollingOverlay.swift
//  Author: Swapnil Roy
//  Date Modified: 5/1/24
//  
//
//  Description: Overlay view for image scrolling in the card view.
//
//  Variable Type Descriptions:
//  - Binding: A reference to a value, used to keep the data in sync between two views.
//  - Int: An integer type.
//

import SwiftUI

/**
    A view that represents an overlay for image scrolling in the card view.
 
    @param currentImageIndex: The current image index.
    @param imageCount: The total number of images.
*/
struct ImageScrollingOverlay: View {
    
    @Binding var currentImageIndex: Int
    let imageCount: Int
    
    var body: some View {
        HStack { // stack the left and right scrollpanes side by side
            Rectangle() // left rectangle
                .onTapGesture { // when tapped
                    updateImageIndex(increment: false) // scroll to previous image
                } // onTapGesture
            
            Rectangle() // right rectangle
                .onTapGesture { // when tapped
                    updateImageIndex(increment: true) // scroll to next image
                } /// onTapGesture
        } /// HStack
        .foregroundStyle(.white.opacity(0.01)) // make the rectangles transparent
    } /// body
} /// ImageScrollingOverlay

/** 
    Extension to provide some helper methods.

    @updateImageIndex: Updates the image index based on the increment value.
*/
private extension ImageScrollingOverlay {
    /**
        Updates the image index based on the increment value.
     
        @param increment: A random boolean value indicating whether to increment the index.
    */
    func updateImageIndex(increment: Bool) {
        if increment { // if increment is true
            guard currentImageIndex < imageCount - 1 else { // if at the last image
                return // return (stop scrolling)
            } /// guard
            currentImageIndex += 1 // increment image index
        } else { // if increment is false
            guard currentImageIndex > 0 else { // if at the first image
                return // return (stop scrolling)
            } /// guard
            currentImageIndex -= 1 // decrement image index
        } /// else
    } /// updateImageIndex
} /// extension

#Preview { // preview the image scrolling overlay
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 3) // load the image scrolling overlay
} /// Preview
