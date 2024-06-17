//
//  ButtonRoles.swift
//  SwiftUIButton
//
//  Created by Swapnil Roy on 1/31/24.
//

import SwiftUI

struct ButtonRoles: View {
    var body: some View {
        VStack {
            Button("Delete", role: .destructive) {
                print("Delete")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Delete", role: .destructive) {
                print("Delete")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button("Cancel", role: .cancel) {
                print("Delete")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
            Button("Cancel", role: .cancel) {
                print("Delete")
            }
            .buttonStyle(.bordered)
            .controlSize(.large)

        }
    }
}

#Preview {
    ButtonRoles()
}
