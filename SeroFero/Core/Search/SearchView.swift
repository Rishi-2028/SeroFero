//
//  SearchView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12 ) {
//                    ForEach(viewModel.users) { user in
//                        NavigationLink(value: user) {
//                            HStack {
//                                Image("rishi")
//                                    .resizable()
//                                    .scaledToFill()
//                                    .frame(width: 50, height: 50 )
//                                .clipShape(Circle())
//                                
//                                VStack(alignment: .leading) {
//                                     Text("huba.official")
//                                        .fontWeight(.semibold )
//                                    
//                                    Text("HUBA")
//                                        
//                                }
//                                .font(.footnote)
//                                Spacer()
//                            }
//                            .padding( .horizontal)
//                        }
//                        
//                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText , prompt: "Search")
            }
//            .navigationDestination(for: DBUser.CodingKeys) { user in
//                ProfileView()
//            }
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
