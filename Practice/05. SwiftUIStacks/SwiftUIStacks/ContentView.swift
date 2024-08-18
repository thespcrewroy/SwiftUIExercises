//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Swapnil Roy on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack (spacing: 15) {
                PricingView(
                    title: "Basic",
                    price: "$9",
                    textColor: .white,
                    bigColor: .purple
                )
                
                ZStack {
                    PricingView(
                        title: "Pro",
                        price: "$19",
                        textColor: .black,
                        bigColor: Color(red: 248/255, green: 240/255, blue: 240/255)
                    )
                    
                    DescriptionView(
                        text: "Best for designers",
                        offsetY: 87
                    )
                }
            }
            .padding(.horizontal)
            
            ZStack {
                PricingView(
                    title: "Team",
                    price: "$299",
                    textColor: .white,
                    bigColor: Color(red: 62/255, green: 63/255, blue: 70/255),
                    icon: "wand.and.rays"
                )
                .padding()
                
                DescriptionView(
                    text: "Perfect for teams with 20 members",
                    offsetY: 107
                )
            }
            
            // Add a spacer
            Spacer()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct HeaderView: View {
        var body: some View {
            HStack {
                VStack (alignment: .leading, spacing: 2) {
                    Text("Choose")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                    Text("Your Plan")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.black)
                }
                Spacer()
            }
            .padding()
        }
    }
    
    struct PricingView: View {
        
        var title: String
        var price: String
        var textColor: Color
        var bigColor: Color
        var icon: String?
        
        var body: some View {
            VStack {
                
                if let icon = icon {
                    
                    Image(systemName: icon)
                        .font(.largeTitle)
                        .foregroundColor(textColor)
                    
                }
                
                Text(title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .foregroundColor(textColor)
                Text(price)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .foregroundColor(textColor)
                Text("per month")
                    .font(.headline)
                    .foregroundColor(textColor)
            }
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 100)
            .padding(40)
            .background(bigColor)
            .cornerRadius(10.0)
        }
    }
}

struct DescriptionView: View {
    
    var text: String
    var offsetY: CGFloat
    
    var body: some View {
        Text(text)
            .font(.system(.caption, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(5)
            .background(Color(red: 255/255, green: 183/255, blue: 37/255))
            .offset(x: 0, y: offsetY)
    }
}
