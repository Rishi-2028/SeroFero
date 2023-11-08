//
//  CurrentUserProfileView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI




struct CurrentUserProfileView: View {
    let user: DBUser
  
    @State private var showSettingView = false
    
   
 
    
    
    var body: some View {
        NavigationStack {
            ScrollView( showsIndicators: false) {
                
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                    
                    //user content list view
                    UserContentListView()
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(Color.black)
                        .onTapGesture {
                            // Toggle the sheet visibility
                            showSettingView.toggle()
                        }
                }
            }
                .sheet(isPresented: $showSettingView, content: {
                    GeometryReader(content: { geometry in
                        SettingsView()
//                            .frame(height: geometry.size.height / 3)
                            .presentationDetents([.medium])
                            .padding(.vertical, 10)
                    })
                       
                    
                })
                
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
//        .padding(.horizontal)
    }
}


struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: dev.user)
    }
}
