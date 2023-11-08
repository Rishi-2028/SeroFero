//
//  SelectedTabBarView.swift
//  SeroFero
//
//  Created by Rishi on 05/10/2023.
//

import SwiftUI


struct SelectedTabBarView: View {
    @Binding var selectedTab: PlaceTypes
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(PlaceTypes.allCases.count)
        return UIScreen.main.bounds.width / count - 10
    }

    @Namespace var  animation
    var body: some View {
        HStack {
            ForEach(PlaceTypes.allCases) { filter in
                VStack(spacing: 8) {
                    Image(systemName: iconForPlaceType(filter))
                        .font(.system(size: 20))
                        .foregroundColor(selectedTab.rawValue == filter.rawValue ? .black : .gray)
                    
                    Text(filter.title)
                    
                        .font(.subheadline)
                        .fontWeight(selectedTab.rawValue == filter.rawValue ? .semibold : .regular)
                        .multilineTextAlignment(.center)
                    
                    
                    if selectedTab.rawValue == filter.rawValue {
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: filterBarWidth, height: 2)
                            .matchedGeometryEffect(id: "item", in: animation)
                        //                                    .fixedSize(horizontal: true, vertical: false)
                        
                    } else {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: filterBarWidth, height: 1)
                    }
                    
                }
                .padding(.horizontal)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selectedTab = filter
                    }
                }
            }
        }
    }
}


#Preview {
    SelectedTabBarView(selectedTab: .constant(PlaceTypes.adventorous))
}
