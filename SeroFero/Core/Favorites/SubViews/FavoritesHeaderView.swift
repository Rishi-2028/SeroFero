//
//  FavoritesHeaderView.swift
//  SeroFero
//
//  Created by Rishi on 23/09/2023.
//

import SwiftUI

struct FavoritesHeaderView: View {
    let user: DBUser
    let image: String
    let title: String
    let placeName: String
    let location: String
    let likesCount: String
    
    var body: some View {
        NavigationLink(destination: {
            FavoritesDetailView(user: user, images: [image], placeName: placeName, location: location, likesCount: likesCount)
        }, label: {
            HStack(spacing: 20) {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
                Text(title)
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            
        })
        .padding(.horizontal)
    }
}

struct FavoritesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesHeaderView(user: dev.user, image: "image1", title: "Trendings", placeName: "Pokhara", location: "Kaski", likesCount: "30")
    }
}
