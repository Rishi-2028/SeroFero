//
//  MapSearchView.swift
//  SeroFero
//
//  Created by Rishi on 01/10/2023.
//

import SwiftUI
import MapKit


struct MapSearchView: View {
    @Binding var searchText: String
    var body: some View {
        VStack() {
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .padding()
                TextField("search places", text: $searchText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .strokeBorder(.gray)
                    .frame(height: 40)
                    .foregroundStyle(.white)
                    .padding()
            }
            

            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    MapSearchView(searchText: .constant("Search"))
}
