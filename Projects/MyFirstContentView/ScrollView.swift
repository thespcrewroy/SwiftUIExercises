//
//  ScrollView.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct ScrollViewer: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: true) {
            HStack {
                Group {
                    Card (
                        thetitle: "Grand Canyon",
                        theimage: "grandcanyon",
                        thedescription: "I almost died walking off the edge when I was just a baby. It was a crazy experience."
                    )
                    Divider()
                    Card (
                        thetitle: "Chucky Cheese",
                        theimage: "chucky",
                        thedescription: "I was relly scared of Chucky as a kid. Anamatronics are one of the creepiest inventions ever."
                    )
                    Divider()
                    Card (
                        thetitle: "Tree House",
                        theimage: "treehouse",
                        thedescription: "My dad built a tree house for me and my friends. We made a council that help meetings there."
                    )
                    Divider()
                    Card (
                        thetitle: "Plane",
                        theimage: "plane",
                        thedescription: "I love flying to different countries. Once, me and my family traveled to Peru and saw Machu Picchu to see their famous terraces."
                    )
                }
            }
        }
    }
}

#Preview {
    ScrollViewer()
}
