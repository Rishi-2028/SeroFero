//
//  ProfileHeaderView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: DBUser
    @State private var showEditProfile = false
    
    var body: some View {
        
        
        VStack(spacing: 10) {
            HStack {
                CircularProfileImage(user: user, iconSize: .large, size: .xLarge)
                Spacer()
                HStack(spacing: 8){
                    UserStatView (value: 3, title: "Post")
                    UserStatView (value: 3, title: "Followers")
                    UserStatView (value: 3, title: "Following")
                    
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4) {
                
                // name and bio
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.userName )
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading )
                .padding(.horizontal)
                
                
                
                
            }
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow User")
                }
            } label: {
                Text(user.isCurrentUser ? "EditProfile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .frame(width: 360, height: 32 )
                    .background(user.isCurrentUser ? .white : Color(.systemBlue))
                    .cornerRadius(8)
                
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear , lineWidth: 1)
                    }
                
            }
            Divider()
        }
        .sheet(isPresented: $showEditProfile, content: {
            EditProfileView(user: user, userManager: UserManager(), storageManager: StorageManager())
        })
    }
}


struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 72)
        
        
        
        
    }
}
