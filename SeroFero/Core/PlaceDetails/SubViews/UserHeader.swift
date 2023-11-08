//
//  UserHeader.swift
//  SeroFero
//
//  Created by Rishi on 19/09/2023.
//

import SwiftUI

struct UserHeader: View {
    let user: DBUser
    var body: some View {
        
        NavigationLink {
            ProfileView(user: user)
        } label: {
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        
                        // name and bio
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.userName)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text("JourneyingTwogether")
                                .font(.subheadline )
                        }
                        .frame(maxWidth: .infinity, alignment: .leading )
                        .padding(.horizontal, 8)
                        
                        
                    }
                    CircularProfileImage(user: user, iconSize: .large, size: .large)
                    

                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()
                
                .padding(.vertical,6)
            }
            
            
            
            .padding(.horizontal)
        }

        
        
        
    }
}

struct UserPlace_Previews: PreviewProvider {
    static var previews: some View {
        UserHeader( user: dev.user)
    }
}
