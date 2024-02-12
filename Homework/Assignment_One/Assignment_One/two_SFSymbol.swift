//
//  two_SFSymbol.swift
//  Assignment_One
//
//  Created by Swapnil Roy on 1/29/24.
//

import SwiftUI

struct two_SFSymbol: View {
    var body: some View {
        Image(systemName: "airplane")
            .font(.system(size: 300))
            .rotationEffect(.degrees(-90))
        
    }
}

#Preview {
    two_SFSymbol()
}
