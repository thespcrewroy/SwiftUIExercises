//
//  Title: MainTabView.swift
//  Author: Swapnil Roy
//  Date Modified: 5/1/24
//
//  Description: Main Tab View for the app. Contains the root tab, 
//  search tab, inbox tab, and profile tab.
//

import SwiftUI

/** Instantiate Tab Views. */
struct MainTabView: View {
    var body: some View {
        TabView { // create a tab view
            CardStackView() // load card stack view as root tab
                .tabItem { Image(systemName: "flame") } // icon for root tab
                .tag(0) // tag for root tab
            
            Text("Search View") // search tab (not implemented yet)
                .tabItem { Image(systemName: "magnifyingglass") } // icon for search tab
                .tag(1) // tag for search tab
            
            Text("Inbox View") // inbox tab (not implemented yet)
                .tabItem { Image(systemName: "message.fill") } // icon for inbox tab
                .tag(2) // tag for inbox tab

            CurrentUserProfileView(user: MockData.users[0]) // load user 0 profile as profile tab
                .tabItem { Image(systemName: "person") } // icon for profile tab
                .tag(3) // tag for profile tab
        }
        .tint(.primary) // automatically adjust system color in dark mode
    } /// body
} /// MainTabView

#Preview { // preview the main tab view
    MainTabView() // load the main tab view
        .environmentObject(MatchManager()) // pass the match manager to the main tab view
} /// Preview
