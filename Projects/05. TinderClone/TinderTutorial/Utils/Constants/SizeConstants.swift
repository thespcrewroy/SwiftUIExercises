//
//  Title: SizeConstants.swift
//  Author: Swapnil Roy
//  Date Modified: 5/2/24
//
//  Description: Constants for sizes and dimensions.
//

import SwiftUI

/**
    Constants for sizes and dimensions.
*/
struct SizeConstants {
    /** Compute swiping threshold (swipe amount before snapping back) based on the size of the phone screen. */
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8 // 0.8 is the cutoff percentage
    } /// screenCutoff
    
    /** Make width relative and adaptive to the size of the current screen */
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20 // 20 is padding relative to the screen
    } /// cardWidth
    
    /** Make height relative and adaptive to the size of the current screen */
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45 // 1.45 is aspect ratio relative to the screen
    } /// cardHeight
}
