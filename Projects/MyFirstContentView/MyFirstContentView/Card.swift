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
    var thedescription: String
    
    var body: some View {
        ZStack {
            Color.orange
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(thetitle)
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                    .offset(x: 0, y: -40)
                Image(theimage)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 100)
                    .frame(width: 400)
                Text(thedescription)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .minimumScaleFactor(0.5)
                    .offset(x:0 , y: 60)
            }
            .background((LinearGradient(gradient: Gradient(colors: [Color("Orange"), Color("Red")]), startPoint: .topLeading, endPoint: .bottomTrailing)))
            
        }
        
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(
            thetitle: "Grand Canyon",
            theimage: "grandcanyon",
            thedescription: "I almost died walking off the edge when I was just a baby. It was a crazy experience."
        )
    }
}
