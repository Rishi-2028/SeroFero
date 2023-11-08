//
//  ActivitiesView.swift
//  SeroFero
//
//  Created by Rishi on 15/09/2023.
//

import SwiftUI


enum PlaceDetailFilter: Int , CaseIterable , Identifiable{
    
    case activities
    case comments
    case locations
    var title: String {
        switch self {
        case .activities: return "Activities"
        case .comments: return "Comments"
        case .locations: return "Locations"
        }
    }
    var id: Int {return self.rawValue}
}
 private var filterBarWidth: CGFloat {
    let count = CGFloat(ProfilePostFilter.allCases.count)
    return UIScreen.main.bounds.width / count - 20
}

struct ActivitiesView: View {
    
    private let gridItems = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    @State private var selectedTab: PlaceDetailFilter = .activities
    @Namespace var  animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfilePostFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ForEach(PlaceDetailFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedTab == filter ? .semibold : .regular)
                        if selectedTab == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedTab = filter
                        }
                    }
                }
            }
            //Post Grid View
            switch selectedTab {
            case .activities:
                ScrollView {
                    LazyVGrid(columns: gridItems) {
                        ForEach(0 ... 3, id: \.self) { index in
                            TODOView(title: "NightOut", icon: "figure.socialdance")
                        }
                    }
                    .padding(.horizontal)
                .padding(.vertical, 8)
                }
                
                .frame(height: 400) // Fixed frame height for scrolling
               
                
            case .comments:
                Text("Comments content goes here")
                    .padding()
                
            case .locations:
                Text("Locations content goes here")
                    .padding()
            }
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}

