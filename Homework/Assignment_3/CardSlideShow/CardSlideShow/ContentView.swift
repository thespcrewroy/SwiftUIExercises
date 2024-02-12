//
//  Cards.swift
//  ScrollViewAssignment
//
//  Created by Catherine Chu on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var thetitle = "Ace of Diamonds"
    @State var theimage = "AD"
    @State var counter = 0
    var titles = ["Ace of Clubs", "Ace of Diamonds", "Ace of Hearts", "Ace of Spades"]
    var images = ["AC", "AD", "AH", "AS"]
    
    var body: some View {
      //  ZStack {
    
                VStack {
                    Button (action: {
                        self.counter += 1
                        self.theimage = self.images[self.counter]
                        self.thetitle = self.titles[self.counter]
                        if self.counter == self.images.count - 1 {
                            self.counter = 0
                        }
                    })
            {
                Text("Click Here")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
            }
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
            
     
     
     //   }
//        Color.white
//            .opacity(0.2)
//            .edgesIgnoringSafeArea(.all)
        
    }


struct Cards_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            thetitle: "Ace of Diamonds",
            theimage: "AD"
        )
    }
}

struct DawgStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)  .frame(minWidth: 0, maxWidth: .infinity)
//            .padding()
//            .foregroundColor(.white)
//            .font(.title)
//            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.black]), startPoint: .leading, endPoint: .trailing))
//            .cornerRadius(40)
//            .padding(.horizontal, 20)
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
