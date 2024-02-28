//
//  ContentView.swift
//  Pie.swift
//
//  Created by Swapnil Roy on 2/28/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Path {
                path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 290), clockwise: true)
            }
            .fill(Color.yellow)
            
            Path {
                path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 290.0), endAngle: Angle(degrees: 260), clockwise: true)
            }
            .fill(Color.blue)
            Path {
                path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 260.0), endAngle: Angle(degrees: 160), clockwise: true)
            }
            .fill(Color.red)
            
            Path {
                path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: Angle(degrees: 160.0), endAngle: Angle(degrees: 00), clockwise: true)
            }
            .fill(Color.green)
            .offset(x:5, y:20)
            .overlay(
                Text("Green People")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .offset(x: 30, y: -90)
            )
        }
    }
}

#Preview {
    ContentView()
}
