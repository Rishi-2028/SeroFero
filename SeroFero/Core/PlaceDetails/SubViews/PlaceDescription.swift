//
//  PlaceDescription.swift
//  SeroFero
//
//  Created by Rishi on 15/09/2023.
//

import SwiftUI

struct PlaceDescription: View {
//    let place: Place
    let description: String
    
    var body: some View {
        VStack {
            Text(description)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
            
        }
    }
}

struct PlaceDescription_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDescription(description: "Trekkers are suggested to hire local guides as the trail lacks signposts and other infrastructure")
    }
}
