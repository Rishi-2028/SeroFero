//
//  FavoritesDetailView.swift
//  SeroFero
//
//  Created by Rishi on 23/09/2023.
//

import SwiftUI

struct FavoritesDetailView: View {
    let user: DBUser
    let images:  [String]
    var placeName: String
    var location: String
    var likesCount: String
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Trendings")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    NavigationLink {
                        PlaceDetailsView(place: Place(id: "", placeName: ""), user: user, images: images, placeName: placeName, location: location)
                    } label: {
                        TabViewsContent(images: images, placeName: placeName, location: location, likesCount: likesCount)
                    }

                   
                   

                   
                   
                }
                
                .toolbar {
                    HStack(spacing: 10) {
                        Image(systemName: "square.and.arrow.up")
                            .padding(.horizontal)
                        Image(systemName: "ellipsis")
                    }
                    .padding()
                    
                }
            .navigationBarTitleDisplayMode(.inline)
            }

            
        }
    }
}

struct FavoritesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesDetailView(user: dev.user, images: ["image1"], placeName: "lwangghale", location: "lamjung", likesCount: "20")
    }
}
