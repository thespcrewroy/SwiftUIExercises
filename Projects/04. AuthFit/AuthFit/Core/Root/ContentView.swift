//
//  ContentView.swift
//  AuthFit
//
//  Created by Swapnil Roy on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel // casts an AuthViewModel instance
    
    var body: some View {
        
        Group {
            if viewModel.userSession != nil {
                ProfileView() // Send them to ProfileView
            } else {
                LoginView() // Else send them to LoginView
            } // If someone signed up
        } // We have a group of views
    }
}

#Preview {
    ContentView()
}
