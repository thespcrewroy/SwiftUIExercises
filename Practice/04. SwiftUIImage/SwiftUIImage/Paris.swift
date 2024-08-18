//
//  Paris.swift
//  SwiftUIImage
//
//  Created by Swapnil Roy on 1/22/24.
//

import SwiftUI

struct Paris: View {
    var body: some View {
        Image("paris")
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 300)
            .clipShape(.capsule)
            .opacity(0.5)
            .overlay(
                Image(systemName: "heart.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                    .opacity(0.5),
                alignment: .topLeading
            )
    }
}

#Preview {
    Paris()
}
