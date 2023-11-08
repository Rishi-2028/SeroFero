//
//  ProfileView.swift
//  SeroFero
//
//  Created by Rishi on 15/09/2023.
//

import SwiftUI


struct ProfileView: View {
    let user: DBUser

    var body: some View {
        NavigationStack {
            ScrollView( showsIndicators: false) {
               
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                    
                    //user content list view
                    UserContentListView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
