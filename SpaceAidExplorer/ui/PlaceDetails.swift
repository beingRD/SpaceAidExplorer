//
//  SwiftUIView.swift
//  SpaceAidExplorer
//
//  Created by SpaceAid group on 09/11/21.
//

import SwiftUI

struct PlaceDetails: View {
    @State var favorite: Bool
    
    var place: Place
    
    init(place: Place) {
        self.place = place
        favorite = self.place.isFavorite
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(place.name.lowercased())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height * 0.3)
                    .cornerRadius(16)
                    .shadow(radius: 8)
                HStack{
                    VStack{
                        Text("\(Image(systemName: "star.fill")) \(place.rating)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .font(.title3)
                            .foregroundColor(.yellow)
                            .background(.yellow.opacity(0.13))
                            .cornerRadius(12)
                        Text("Rating")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.yellow)
                    }
                    .frame(width: (UIScreen.main.bounds.width - 64) / 3, height: UIScreen.main.bounds.height * 0.1)
                    Spacer()
                    VStack{
                        Text("\(place.distance) km")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .font(.title3)
                            .foregroundColor(.red)
                            .background(.red.opacity(0.13))
                            .cornerRadius(12)
                        Text("Distance")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.red)
                    }
                    .frame(width: (UIScreen.main.bounds.width - 64) / 3, height: UIScreen.main.bounds.height * 0.1)
                    Spacer()
                    VStack{
                        Text("\(Image(systemName: "tram")) \(place.transport)")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .font(.title3)
                            .foregroundColor(.green)
                            .background(.green.opacity(0.13))
                            .cornerRadius(12)
                        Text("Transport")
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.green)
                    }
                    .frame(width: (UIScreen.main.bounds.width - 64) / 3, height: UIScreen.main.bounds.height * 0.1)
                }
                .frame(width: UIScreen.main.bounds.width - 32)
                .padding(.top, 12)
                .padding(.bottom, 8)
                Text("DESCRIPTION")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.leading, 8)
                    .padding(.bottom, 4)
                Text(place.description)
                Text("ADDRESS & MAP PREVIEW")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black.opacity(0.6))
                    .padding(.leading, 8)
                    .padding(.top, 16)
                    .padding(.bottom, 4)
                Text(place.address)
                Image(place.map)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width - 32)
                    .cornerRadius(16)
                    .shadow(radius: 8)
            }
            .navigationTitle(place.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                place.favorite()
                favorite = !favorite
            }) {
                Image(systemName: favorite ? "heart.fill" : "heart")
            })
            .padding()
        }
    }
}

struct PlaceSpecif_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetails(place: places.first!)
    }
}
