//
//  CarouselScrollView.swift
//  SeroFero
//
//  Created by Rishi on 15/09/2023.
//

import SwiftUI

struct PlaceHeader: View {
    let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 3)
                .foregroundColor(.blue)
        }
//        .padding(.horizontal)
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct CarouselScrollView: View {
    
    let imageName: String
    let placeName: String
    let title: String
    //    let icon: Image
    //    let action: (() -> Void)?
    
    var body: some View {
        
           
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 3) {
                    PlaceHeader(title: title)
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 10) {
                                ForEach(0 ... 5, id: \.self) {  item in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 200)
                                        .cornerRadius(10)
                                        .overlay(
                                            VStack(alignment: .leading, spacing: 4) {
                                                
                                                Text(placeName)
                                                    .font(.headline)
                                                    .foregroundColor(Color.black)
                                                    .padding(8)
                                                    .background(Color.white.opacity(0.5))
                                                    .cornerRadius(8)
                                            }
                                            
                                                .padding(.horizontal, 8),
                                            alignment: .bottomLeading
                                        )
                                    
                                }
                                
                            }
                            
                            .padding(.vertical, 6)
                        }
                        
                }
                .padding(.horizontal)
            }
            
        }

        
        
        
    }
}

struct CarouselScrollView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselScrollView(
            imageName: "image1", placeName: "Badimalika", title: "Nearby Places")
        
        .frame(width: 300, height: 400)
    }
}
