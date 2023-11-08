//
//  TabBarView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//


import SwiftUI


struct TabBarView: View {
    let user: DBUser
    @State private var selectedTab = 0
    @State private var showAddPlaceImageView = false
    @State private var showCreateNewPostSheet = false
   
       var body: some View {
           
           TabView(selection: $selectedTab) {
               FeedView(user: user)
                   .tabItem {
                       Image(systemName: selectedTab == 0 ? "house.fill" : "house")
//                           .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                   }
                   .onAppear {selectedTab = 0}
                   .tag(0)
               
               
               SearchView()
                   .tabItem {
                       Image(systemName: "magnifyingglass")
                   }
                   .onAppear{selectedTab = 1}
                   .tag(1)
               
               Text("")
                   .tabItem {
                       Image(systemName: "plus")
                   }
                   .onAppear{selectedTab = 2}
                   .tag(2)
                  
               FavoritesView(user: user)
                   .tabItem {
                       Image(systemName: selectedTab == 3 ?  "heart.fill" : "heart")
                           .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                   }
                   .onAppear{selectedTab = 3}
                   .tag(3)
               CurrentUserProfileView(user: user)
                   .tabItem {
                       Image(systemName:  selectedTab == 4 ? "person.fill" : "person")
                           .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                   }
                   .onAppear{selectedTab = 4}
                   .tag(4)
           }
           .onChange(of: selectedTab, { oldValue, newValue in
               if selectedTab == 2 {
                   showCreateNewPostSheet = true
               }
           })
  
           .sheet(isPresented: $showCreateNewPostSheet) {
                selectedTab = 0
           } content: {
               CreateNewPostView()
           }
           .tint(.black)

          
          
       }
   }


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(user: dev.user)
    }
}
