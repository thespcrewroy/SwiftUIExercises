//
//  one_text.swift
//  Assignment_One
//
//  Created by Swapnil Roy on 1/24/24.
//

import SwiftUI

struct one_text: View {
    var body: some View {
        Text("This is a custom font with a fixed font size")
            .font(.custom("RubikBurned-Regular", size: 65))
            .multilineTextAlignment(.center)
            .padding()
        Text(" This text has a line limit and padding. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            .font(.system(.title, design: .rounded))
            .padding()
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .shadow(color: .gray, radius: 10, x: 5, y: 10)
        Text("This is a text with background color")
            .background(Color.green)
            .bold()
            
    }
}

#Preview {
    one_text()
}
