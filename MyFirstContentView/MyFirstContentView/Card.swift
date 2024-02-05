//
//  Card.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct Card: View {
    var thetitle: String
    var theimage: String
    
    var body: some View {
        ZStack {
            VStack {
                Text(thetitle)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.red)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                    .offset(x: 0, y: -40)
                Image(theimage)
                    .padding(.bottom, 100)
            }
            .background(Color.black)
            
        }
        Color.white
            .opacity(0.2)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(
            thetitle: "Grand Canyon",
            theimage: "grandcanyon"
        )
    }
}
