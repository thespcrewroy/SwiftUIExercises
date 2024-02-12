//
//  SFImages.swift
//  SwiftUIImage
//
//  Created by Swapnil Roy on 1/22/24.
//

import SwiftUI

struct SFImages: View {
    var body: some View {
        Image(systemName: "cloud.sun.rain")
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.indigo, .yellow, .gray)
    }
}

#Preview {
    SFImages()
}
