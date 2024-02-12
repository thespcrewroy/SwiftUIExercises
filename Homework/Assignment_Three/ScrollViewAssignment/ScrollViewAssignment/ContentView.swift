//
//  ContentView.swift
//  ScrollViewAssignment
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: true) {
            HStack {
                Group {
                    Cards (
                        thetitle: "Ace of Diamonds",
                        theimage: "AD"
                    )
                    Cards (
                        thetitle: "Ace of Clubs",
                        theimage: "AC"
                    )
                    Cards (
                        thetitle: "Ace of Hearts",
                        theimage: "AH"
                    )
                    Cards (
                        thetitle: "Ace of Spades",
                        theimage: "AS"
                    )
                    Cards (
                        thetitle: "Jack of Diamonds",
                        theimage: "JD"
                    )
                    Cards (
                        thetitle: "Jack of Clubs",
                        theimage: "JC"
                    )
                    Cards (
                        thetitle: "Jack of Hearts",
                        theimage: "JH"
                    )
                    Cards (
                        thetitle: "Jack of Spades",
                        theimage: "JS"
                    )
                    Cards (
                        thetitle: "Queen of Diamonds",
                        theimage: "QD"
                    )
                    Cards (
                        thetitle: "Queen of Clubs",
                        theimage: "QC"
                    )
                }
            }
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.47, saturation: 0.738, brightness: 1.0)/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
