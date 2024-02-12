//
//  ParisDarken.swift
//  SwiftUIImage
//
//  Created by Swapnil Roy on 1/22/24.
//

import SwiftUI

struct ParisDarken: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
            .overlay(
                Color.black
                    .opacity(0.4)
                    .overlay(
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .frame(width: 200)
                    )
                )
    }
}

#Preview {
    ParisDarken()
}
