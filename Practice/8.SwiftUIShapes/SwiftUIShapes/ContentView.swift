//
//  ContentView.swift
//  SwiftUIShapes
//
//  Created by Swapnil Roy on 2/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Path() { path in
            path.move(to: CGPoint(x:20, y:20))
            path.addLine(to: CGPoint(x:300, y:20))
            path.addLine(to: CGPoint(x:300, y:200))
            path.addLine(to: CGPoint(x:20, y:200))
            path.closeSubpath()
        }
        .stroke(.green, lineWidth: 10)
    }
}

#Preview {
    ContentView()
}
