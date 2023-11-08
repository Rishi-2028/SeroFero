//
//  CreateWishlistView.swift
//  SeroFero
//
//  Created by Rishi on 20/09/2023.
//

import SwiftUI

struct CreateWishlistView: View {
    @Binding var isPresented: Bool
    @Binding var isHeartButtonTapped: Bool
    @State private var text = ""
    @State private var showMessage = false

//    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color.white
                .opacity(0.9)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button(action: {
                        // Dismiss the view when the "multiply" button is tapped
                        withAnimation {
                            isPresented = false
                        }
                        if isHeartButtonTapped {
                            isHeartButtonTapped.toggle()
                        }
                    }) {
                        Image(systemName: "multiply")
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("Create wishlist")
                        .foregroundColor(.black)
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                .padding(.bottom, 35)

                
                VStack {
                    TextField("Name", text: $text)
                        .padding(.horizontal, 8)
                        .frame(width: .infinity, height: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 2)
                    )
                }
                .padding(.bottom)
                     

                Divider()
                
                HStack {
                    Spacer()
                    Button {
                        // Toggle the message and dismiss the view
                        withAnimation(.easeInOut(duration: 1.0)) {
                            showMessage.toggle()
                        }
                        withAnimation {
                            isPresented = false
                        }
                       
                    } label: {
                        Text("Create")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.white)
                            .frame(width: .infinity, height: 50)
                            .background(.black)
                            .cornerRadius(10)
//                            .padding()
                    }

                }
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: 250)
            
            .background(Color.white)
            
            .cornerRadius(10)
        }
        .shadow(radius: 20)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct CreateWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWishlistView(isPresented: .constant(false), isHeartButtonTapped: .constant(false))
    }
}
