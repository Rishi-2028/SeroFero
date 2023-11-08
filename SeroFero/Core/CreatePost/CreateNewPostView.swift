//
//  CreateNewPostView.swift
//  SeroFero
//
//  Created by Rishi on 19/09/2023.
//

import SwiftUI
import PhotosUI


struct CreateNewPostView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
   
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        TextFieldView(title:  "Name of Place")
                        
                        HStack {
                            Image(systemName: "camera")
                                .font(.system(size: 50))
                                .padding()
                            ScrollView(.horizontal) {
                                HStack(spacing: 8) {
                                    ForEach(0...3, id: \.self) { image in
                                       
                                        ZStack(alignment: .trailing) {
                                           
                                                Image("rishi")
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100)
                                                    .cornerRadius(10)
                                            
                                          
                                                Image(systemName: "multiply.circle")
                                                    .foregroundColor(.red)
                                                    .font(.system(size: 24))
                                                    .clipShape(Circle())
                                                    .padding(5)
                                                       
                                                .padding()
                                            
                                        }
                                       
                                            
                                           
                                        
                                    }
                                  
                                }
                            }
                        }
                        TextField("About Place", text: $caption, axis: .vertical)
                            .font(.callout)
                            .padding(.horizontal)
                        
                        
                        TextFieldView(title: "Name of place")
                          
                        TextFieldView(title: "Name of place")
                        TextFieldView(title: "Name of place")
                        TextFieldView(title: "Name of place")
     
                    }
                  
                    
                    .navigationTitle("Create Post")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button("Cancel") {
                               dismiss()
                            }
                            .font(.subheadline)
                            .foregroundColor(.black)
                        }
                }
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarTrailing) {
                            Text("Post")
                                .foregroundStyle(.blue)
                        }
                        
                })
                    .ignoresSafeArea(.container)
                }
               
                
            }
            
            
            
            
            
            
            
            
        }
        
    }
}



struct CreateNewPostView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewPostView()
    }
}

//          HStack {
//                Image("rishi")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 100, height: 100)
//                TextField("Enter your caption", text: $caption, axis: .vertical)
//            }
//        }
//        .onAppear {
//            imagePickerPresented.toggle()
//        }
//        .photosPicker(isPresented: $imagePickerPresented, selection:  $viewModel.selectedImage)
