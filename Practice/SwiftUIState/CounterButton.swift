//
//  CounterButton.swift
//  SwiftUIState
//
//  Created by Swapnil Roy on 2/19/24.
//

import SwiftUI

struct CounterButton: View {
    @State private var counter = 0
    
    var body: some View {
        VStack {
            CounterButtonStyle(counter: $counter, color: .blue)
            CounterButtonStyle(counter: $counter, color: .green)
            CounterButtonStyle(counter: $counter, color: .red)
        }
    }
}

struct CounterButtonStyle: View {
    
    @Binding var counter: Int
    
    var color: Color
    
    var body: some View {
        Button(action: {
            counter += 1
        }) {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(color)
                .overlay {
                    Text("\(counter)")
                        .font(.system(size: 100, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                }
        }
    }
}

#Preview {
    CounterButton()
}
