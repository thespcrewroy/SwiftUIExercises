//
//  three_Image.swift
//  Assignment_One
//
//  Created by Swapnil Roy on 1/29/24.
//

import SwiftUI

struct three_Image: View {
    var body: some View {
        Image("pancakes")
            .resizable()
            .scaledToFit()
            .overlay(
                Color.black
                    .opacity(0.4)
                
            )
    }
}

#Preview {
    three_Image()
}
