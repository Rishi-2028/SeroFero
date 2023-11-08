//
//  TODOVIew.swift
//  SeroFero
//
//  Created by Rishi on 18/09/2023.
//

import SwiftUI

struct TODOView: View {
    var title: String
    var icon: String
    
    var body: some View {
        NavigationLink(destination: ActivitiesDetailsView()) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.randomHue(saturation: 0.7, brightness: 0.7))
                    .frame(width: 175, height: 175)
                
                VStack {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 80, height: 80)
                            .overlay {
                                Image(systemName: icon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor((Color.randomHue(saturation: 0.7, brightness: 0.7)))
                            }
                    }
                    
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct TODOView_Previews: PreviewProvider {
    static var previews: some View {
        TODOView(title: "NightOut", icon: "figure.socialdance")
    }
}
