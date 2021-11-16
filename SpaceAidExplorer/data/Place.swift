//
//  Place.swift
//  SpaceAidExplorer
//
//  Created by SpaceAid group on 06/11/21.
//

import Foundation
import SwiftUI

class Place {
    static let userDefaults: UserDefaults = UserDefaults.standard
    static var itemsCount = 0
    
    let id: Int
    let name: String
    let description: String
    let address: String
    let category: String
    let distance: String
    let rating: String
    let transport: String
    var map: String
    var isFavorite: Bool
    
    init(name: String, description: String, address: String, category: String, map: String){
        Place.itemsCount += 1
        
        self.id = Place.itemsCount
        self.name = name
        self.description = description
        self.address = address
        self.category = category
        self.distance = "3.4"
        self.rating = "4.6"
        self.transport = "line 1"
        self.map = map
        self.isFavorite = Place.userDefaults.bool(forKey: name)
    }
    
    func favorite() {
        if Place.userDefaults.bool(forKey: name) {
            Place.userDefaults.removeObject(forKey: name)
        } else {
            Place.userDefaults.set(true, forKey: name)
        }
        
        isFavorite = !isFavorite
    }
}
