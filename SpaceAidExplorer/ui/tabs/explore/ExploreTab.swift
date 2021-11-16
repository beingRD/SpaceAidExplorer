//
//  ContentView.swift
//  SpaceAidExplorer
//
//  Created by SpaceAid group on 06/11/21.
//

import SwiftUI

public class UIStateModel: ObservableObject
{
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}

struct ExploreTab: View {
    @Environment(\.isSearching) var isSearching
    
    var searchedText: String
    
    var body: some View {
        if isSearching {
            List {
                ForEach(places, id: \.self.id) { place in
                    if place.name.starts(with: searchedText) {
                        PlaceListItem(place: place)
                    }
                }
            }
        } else {
            Carousel(numberOfItems: categories.count)
                .environmentObject(UIStateModel())
        }
    }
}
