//
//  TabView.swift
//  SeroFero
//
//  Created by Rishi on 20/09/2023.
//


import SwiftUI




struct TabViews: View {
    let user: DBUser
    @State private var searchText = ""
    @State private var selectedTab: PlaceTypes = .trending
    @Namespace var  animation

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    SelectedTabBarView(selectedTab: $selectedTab)
                }
                switch selectedTab {
                case .trending:
                  
                        ScrollView {
                                LazyVStack(spacing: 30) {
                                    ForEach(0...5,id: \.self) { content in
                                        NavigationLink {
                                            PlaceDetailsView(place: Place(id: "", placeName: ""), user: user, images: ["rishi"], placeName: "pokhara", location: "kaski")
                                        } label: {
                                           TabViewsContent(images: ["image1"], placeName: "Bandipur", location: "Tanahun", likesCount: "12")
                                        }

                                       
                                    }
                                }
                        }
                    
                    
                case .sightseeing:
                    ScrollView {
                        LazyVStack {
                            ForEach(0...5,id: \.self) { content in
                                ImageSection(placeName: "Jhamsikhel", location: "lalitpur", likesCount: "20", images: ["image1"])
                            }
                        }
                    }
                default:
                    Text("Default Content")
                }
                    
            }
            .searchable(text: $searchText, prompt: "Search")
            
        }
        
    }
}


struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews(user: dev.user)
    }
}

