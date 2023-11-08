//
//  FavoritesView.swift
//  SeroFero
//
//  Created by Rishi on 19/09/2023.
//

import SwiftUI


struct FavoritesView: View {
    let user: DBUser
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    FavoritesHeaderView(user: user, image: "image1", title: "Lakes", placeName: "Pokhara", location: "kaski", likesCount: "20")
                    FavoritesHeaderView(user: user, image: "image1", title: "Lakes", placeName: "Pokhara", location: "kaski", likesCount: "30")
                }
                .padding(.vertical, 20)
            }
            .navigationTitle("Wishlists")
           
        }
        
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(user: dev.user)
    }
}
