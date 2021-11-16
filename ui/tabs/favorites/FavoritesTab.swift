//
//  FavoritesTab.swift
//  SpaceAidExplorer
//
//  Created by SpaceAid group on 13/11/21.
//

import SwiftUI

struct FavoritesTab: View {
    var body: some View {
        if places.filter({ place in
            place.isFavorite
        }).count == 0 {
            Text("Click the \(Image(systemName: "heart")) to add a place to the favorites")
                .font(.headline)
                .foregroundColor(.gray)
        } else {
            List {
                ForEach(places, id: \.self.id) { place in
                    if place.isFavorite {
                        PlaceListItem(place: place)
                    }
                }
            }
        }
    }
}
