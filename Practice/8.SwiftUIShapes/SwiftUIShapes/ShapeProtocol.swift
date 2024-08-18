//
//  ShapeProtocol.swift
//  SwiftUIShapes
//
//  Created by Swapnil Roy on 2/19/24.
//

import SwiftUI

struct ShapeProtocol: View {
    var body: some View {
        Button {
            // Action to perform
        } label: {
            Text("Test")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(Dome().fill(Color.red))
        }
        
        Button {
            
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 200, height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 80, height: 80)
                            .foregroundColor(.blue)
                )
                Text("B")
                    .font(.system(.largeTitle, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 250, height: 50.0)
            }
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(
            x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

#Preview {
    ShapeProtocol()
}
