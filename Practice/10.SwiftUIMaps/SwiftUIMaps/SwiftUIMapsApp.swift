//
//  SwiftUIMapsApp.swift
//  SwiftUIMaps
//
//  Created by Swapnil Roy on 3/7/24.
//

import SwiftUI

@main
struct SwiftUIMapsApp: App {
    
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
