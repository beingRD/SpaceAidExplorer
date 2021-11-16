//
//  SpaceAid_TestApp.swift
//  SpaceAidExplorer
//
//  Created by SpaceAid group on 06/11/21.
//

import SwiftUI

@main
struct SpaceAid_TestApp: App {
    @State var searchedText: String = ""
    @State var selectedTab: Int = 1
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TabView(selection: $selectedTab) {
                    ExploreTab(searchedText: searchedText)
                        .tabItem {
                            Label("Explore", systemImage: "house")
                        }
                        .tag(1)
                    FavoritesTab()
                        .tabItem {
                            Label("Favorites", systemImage: "heart.fill")
                        }
                        .tag(2)
                }
                .navigationTitle(selectedTab == 1 ? "Explore" : "Favorites")
            }
            .preferredColorScheme(.light)
            .searchable(text: $searchedText, prompt: "Looking for something?")
        }
    }
}
