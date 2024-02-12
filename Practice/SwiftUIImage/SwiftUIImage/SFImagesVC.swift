//
//  SFImagesVC.swift
//  SwiftUIImage
//
//  Created by Swapnil Roy on 1/22/24.
//

import SwiftUI

struct SFImagesVC: View {
    var body: some View {
        Image(systemName: "slowmo", variableValue: 0.6)
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.indigo)
            .font(.largeTitle)
    }
}

#Preview {
    SFImagesVC()
}
