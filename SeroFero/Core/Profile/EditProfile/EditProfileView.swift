//
//  EditProfileView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI
import PhotosUI


struct EditProfileView: View {
    @StateObject var viewModel: EditProfileViewModel
    init(user: DBUser, userManager: UserManager, storageManager: StorageManager) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user, storageManager: storageManager, userManager: userManager))
        
    }

    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    PhotosPicker(selection: $viewModel.selectedImage) {
                        if let image = viewModel.profileImage {
                            image
                                .resizable()
                                .foregroundStyle(.white)
                                .background(.gray)
                                .clipShape(Circle())
                                .frame(width: 80, height: 80)
                            
                        } else {
                            CircularProfileImage(user: viewModel.user, iconSize: .large, size: .xLarge)
                        }
                        
                    }
                    Text("Edit Profile Picture")
                        .font(.footnote)
                        .fontWeight(.semibold)
                   
                    
                }
                    VStack(alignment: .leading) {
                        Text("Name")
                           .fontWeight(.semibold)
                        TextField("Enter your name..", text: $viewModel.userName)
                        
                    }
                    Divider()
                    //Bio Field
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio..", text: $viewModel.bio, axis: .vertical)
                    }
                    
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                
                .padding()
                Spacer()
                .navigationTitle("Edit Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement : .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                        .font(.subheadline)
                        .foregroundColor(.black)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            
                            Task {
                                try await viewModel.updateUserData()
                                dismiss()
                            }
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    }
            }
            }
        }
    }


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: dev.user, userManager: UserManager(), storageManager: StorageManager())
    }
}
