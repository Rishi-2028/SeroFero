//
//  WishlistView.swift
//  SeroFero
//
//  Created by Rishi on 21/09/2023.
//

import SwiftUI

struct WishlistView: View {
    @Binding var isPresented: Bool
    @Binding var isHeartButtonTapped: Bool
    @Binding var selectedImage: String?
    @Binding var isCreateWishlistViewPresented: Bool
    var body: some View {
       
        ZStack {
            VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "multiply")
                            .font(.title)
                            .padding(.trailing, 16)
                            .onTapGesture {
                                withAnimation {
                                    isPresented = false
                                }
                                if isHeartButtonTapped {
                                    isHeartButtonTapped.toggle()
                                }
                            }
                    }
                    .padding(.horizontal)
                    .padding(.top, 16)
                    
                    Text("Your Wishlists")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.horizontal, 16)
                    
                    Divider()
                        .padding(.horizontal)
                    
                    
                    
                    Button {
                        
                            isCreateWishlistViewPresented.toggle()
                        
                    } label: {
                        HStack {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(Font.system(size: 30))
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white)
                                        .shadow(radius: 2)
                                )
                                .frame(width: 80, height: 80)
                            
                            Text("Create a New Wishlist")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                       
                        .padding(.horizontal, 16)
                        .padding(.top, 10)
                    }
                    

                    
                   
                    
                    Spacer()
            }
        }
    }
}

struct WishlistView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistView(isPresented: .constant(false), isHeartButtonTapped: .constant(false), selectedImage: .constant(.none), isCreateWishlistViewPresented: .constant(false))
    }
}
