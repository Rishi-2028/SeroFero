//
//  TabViewsContent.swift
//  SeroFero
//
//  Created by Rishi on 20/09/2023.
//

import SwiftUI



struct TabViewsContent: View {
    
    let images:  [String]
    var placeName: String
    var location: String
    var likesCount: String
    var body: some View {
       
            // ImageSections within a ScrollView
            ScrollView {
                VStack {
                    ImageSection(placeName: placeName, location: location, likesCount: likesCount, images: images)
                    
                    
                }
            }
        
    }
}


struct TabViewsContent_Previews: PreviewProvider {
    static var previews: some View {
        TabViewsContent(images: ["rishi"], placeName: "Pokhara", location: "Kaski", likesCount: "20")
    }
}

struct ImageTitle: View {
    var placeName: String
    var location: String
    var likesCount: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text(placeName)
                .font(.headline)
                .fontWeight(.bold)
            Text(location)
                .font(.footnote)
                .foregroundColor(.secondary)
            HStack {
                Image(systemName: "heart")
                Text(likesCount)
                Text("people love this")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}




struct ImageSection: View {
    var placeName: String
    var location: String
    var likesCount: String
    let images: [String]
//    let heartButtonAction: () -> Void // Closure for the heart button action
    @State private var selectedImage: String?
    @State private var isCreateWishlistViewPresented = false
    @State private var isHeartButtonTapped = false
//    @Binding var isCreateWishlistViewPresented: Bool
  

 
    
    var body: some View {
    
        ZStack {
            VStack {
                    ZStack(alignment: .topTrailing) {
                        TabView {
                            ForEach(images, id: \.self) { image in
                                GeometryReader { geometry in
                                    Image(image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: geometry.size.width, height: geometry.size.height)
                                        .clipped()
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                        .frame(height: 350)
                        .tabViewStyle(PageTabViewStyle())

                        Button(action: {
                            isHeartButtonTapped.toggle()
                           
                                if isHeartButtonTapped {
                                    
                                    withAnimation {
                                        isCreateWishlistViewPresented.toggle()
                                    }
                                
                                
                            }
                            
                        }) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(isHeartButtonTapped ? .red : .white) // Change color based on state
                                .font(Font.system(size: 30))
                                .padding(10)
                                .cornerRadius(15) // Add corner radius based on state
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    
                ImageTitle(placeName: placeName, location: location, likesCount: likesCount)
                    
                      
                     
                   
                }
            
            
        }
        
       
       
    }
}


