//
//  FeedView.swift
//  SeroFero
//
//  Created by Rishi on 19/09/2023.
//

import SwiftUI

struct FeedView: View {
    let user: DBUser
    @State private var searchText = ""
    @State private var isCreateWishlistViewPresented = false
    @State private var isHeartButtonTapped = false
    
    var body: some View {
     
            NavigationStack {
                TabViews(user: user)
        }
            .searchable(text: $searchText)
            
        
        
        
    }
        
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(user: dev.user)
    }
}



