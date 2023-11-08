//
//  PlaceDescribe.swift
//  SeroFero
//
//  Created by Rishi on 08/11/2023.
//

import SwiftUI


struct PlaceTypeView: View {
    let index: Int
    @Binding var selectedPlace: Int?

    var body: some View {
        let placeTypes = ["SightSeeing", "Adventorous", "Trekking", "LakeFront", "Cabins", "Cities", "Camping", "Fesivals", "World Heritage", "Farming", "Caves"]

        let isSelected = selectedPlace == index
        let borderColor = isSelected ? Color.blue : Color.gray.opacity(0.5)

        VStack {
            Image(systemName: "house")
                .font(.system(size: 30))
                Text(placeTypes[index])
                    .font(.caption)
                    .foregroundColor(isSelected ? .blue : .black)
        }
        .frame(width: 150, height: 100)
        .background(Color.white)
        .border(borderColor, width: 1)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            selectedPlace = index
        }
    }
}


struct PlaceDescribe: View {
    private let gridItems = Array(repeating: GridItem(.flexible(), spacing: 5), count: 2)
    @State private var title: String = ""
    @State private var selectedPlace: Int?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Which of these best describe your place?")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                LazyVGrid(columns: gridItems, alignment: .leading, spacing: 10) {
                                    ForEach(0..<10, id: \.self) { index in
                                        PlaceTypeView(index: index, selectedPlace: $selectedPlace)
                                    }
                                }
                
                VStack {
                    Text("Lets give your place title")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    TextEditor(text: $title)
                        .background(Color.white)
                        .border(.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                }
                
                VStack {
                    Text("Which Season is best to visit this place?")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                }
                LazyVGrid(columns: gridItems, alignment: .leading) {
                    ForEach(0...3, id: \.self) { placetype in
                        VStack( spacing: 10) {
                            Image(systemName: "sun.min")
                                .font(.system(size: 30))
                            Text("House")
                        }
                        
                        
                        
                       
                    }
                    .frame(width: 150, height: 100)
                    .background(.white)
                    .border(.gray.opacity(0.5), width: 1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                VStack {
                    Text("Where is your Place located?")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                }
                Divider()
                
                VStack {
                    Text("Add Some Photos of your place?")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                }
                Divider()
                
                VStack {
                    Text("Create Your Description")
                        .font(.title)
                    .fontWeight(.semibold)
                    Text("Share what makes your place special.")
                        .font(.footnote)
                    
                }

                
                
                
                
                
                
             
                
                
            
                
            }
            .padding()
        }
    }
}

#Preview {
    PlaceDescribe()
}
