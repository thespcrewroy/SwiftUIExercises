//
//  Cards.swift
//  ScrollViewAssignment
//
//  Created by Catherine Chu on 9/13/23.
//

import SwiftUI

struct Cards: View {
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

struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        Cards(
            thetitle: "Ace of Diamonds",
            theimage: "AD"
        )
    }
}
