//
//  ContentView.swift
//  Assignment_Two
//
//  Created by Swapnil Roy on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CandidateView(
                name: "John Ossof",
                birthplaceAndJob: "Atlanta Georgia Investigative Reporter",
                party: "Party: Democratic",
                spouse: "Spouse: Alisha Kramer",
                image: "John",
                offsetBlockY: -30
            )
            
            CandidateView(
                name: "David Perdue",
                birthplaceAndJob: "Macon Georgia United States Senator",
                party: "Party: Republican",
                spouse: "Spouse: Bonnie Perdue",
                image: "David",
                offsetBlockY: 20
            )
        }
    }
}

#Preview {
    ContentView()
}

struct CandidateView: View {
    
    var name: String
    var birthplaceAndJob: String
    var party: String
    var spouse: String
    var image: String
    var offsetBlockY: CGFloat
    
    
    var body: some View {
        VStack {
            Text(name)
                .font(.system(size: 35))
                .fontWeight(.heavy)
                .fontDesign(.rounded)
                .padding(.bottom, 10)
            Text(birthplaceAndJob)
                .fontWeight(.bold)
            HStack {
                Text(party)
                Text(spouse)
            }
            .fontWeight(.bold)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .clipShape(.ellipse)
                .offset(x:0, y:10)
        }
        .offset(x: 0, y: offsetBlockY)
    }
}
