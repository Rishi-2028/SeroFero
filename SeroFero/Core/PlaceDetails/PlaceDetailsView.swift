//
//  PlaceDetailsView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI





struct PlaceDetailsView: View {
    let place: Place
    let user: DBUser
    let images: [String]
    let placeName: String
    let location: String
    @State private var isCreateWishlistViewPresented = false
    @State private var isHeartButtonTapped = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    PlaceDetailImage(images: images)
                    
                    ImageViews(place: Place(id: "", placeName: ""))
                    UserHeader(user: user)
                    ActivitiesView()
                        
                    Divider()
  
                    
                }
            }
            .toolbar(content: {
                HStack {
                    
                        Circle()
                            .fill(.white)
                            .frame(width: 40, height: 40)
                            .overlay {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(.black)
                                    .font(Font.system(size: 15))
                                    .padding(10)
                                    .cornerRadius(15)
                            }
                            
                        
                    
                    
                    HeartToggleButton(isHeartButtonTapped: $isHeartButtonTapped, isCreateWishlistViewPresented: $isCreateWishlistViewPresented)
                   
                  
                }
            })
            
            .ignoresSafeArea()
            
            
        }
    }
}

struct PlaceDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetailsView( place: Place(id: "", placeName: ""), user: dev.user, images: ["rishi"], placeName: "Pokhara", location: "Kaski")
    }
}

struct ImageViews: View {
    let place: Place
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack(spacing: 8) {
                Image(systemName: "mappin.and.ellipse")
                Text(place.placeName ?? "")
                Spacer()
            }
            .font(.footnote)
        
            PlaceHeader(title: place.placeName ?? "")
            HStack {
                Image(systemName: "calendar")
                    .font(Font.system(size: 30))
                    
                Text("Best Time To Visit - \(place.seasonType ?? "")")
            }
            .foregroundColor(.yellow)
            .padding(.vertical,10)
            
            PlaceDescription(description: place.description ?? "")
                
                
               
                Divider()
            
        }
        .padding(.horizontal)
        
    }
}


struct PlaceDetailImage: View {
    var images: [String]

    var body: some View {
        VStack(spacing: 0) {
                TabView {
                    ForEach(images, id: \.self) { imageName in
                        GeometryReader { geometry in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .clipped()
                                .cornerRadius(10)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
                .frame(height: 350)
            }
    }
}
