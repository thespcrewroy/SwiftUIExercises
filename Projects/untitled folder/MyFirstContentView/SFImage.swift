//
//  SFImage.swift
//  MyFirstContentView
//
//  Created by NMI Class on 2/5/24.
//

import SwiftUI

struct SFImage: View {
    var body: some View {
         Image(systemName: "trash", variableValue: 0.6)
            .font(.system(size: 100))
            .symbolRenderingMode(.palette)
            .foregroundStyle(.indigo)
            .font(.largeTitle)
    }
}

#Preview {
    SFImage()
}
