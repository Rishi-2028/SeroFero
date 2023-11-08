//
//  UserContentListView.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//


import SwiftUI

enum ProfilePostFilter: Int , CaseIterable , Identifiable{
    
    case posts
    case replies
    case likes
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
    var id: Int {return self.rawValue}
}
private let gridItems = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)

//private let gridItems: [GridItem] = [
//    .init(.flexible(), spacing: 1) ,
//    .init(.flexible(), spacing: 1),
//    .init(.flexible(), spacing: 1)
//
//]

struct UserContentListView: View {
    @State private var selectedFilter: ProfilePostFilter = .posts
    @State private var selectedTab: PlaceDetailFilter = .activities
    @Namespace var  animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfilePostFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfilePostFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        if selectedFilter == filter {
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
                            selectedFilter = filter
                        }
                    }
                }
            }
//            Post Grid View
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(0 ... 15, id: \.self){ index in
                        Image("rishi")
                            .resizable()
                            .scaledToFill()
                    }
                }
                .padding(.horizontal)

            .padding(.vertical, 8)
            }
            .scrollDismissesKeyboard(.interactively)
        }
    }
}

struct UserContentListView_Previews: PreviewProvider {
    static var previews: some View {
        UserContentListView()
    }
}
