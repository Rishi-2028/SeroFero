//
//  MessageView.swift
//  SeroFero
//
//  Created by Rishi on 21/09/2023.
//

import SwiftUI

struct MessageView: View {
    @State private var isSheetPresented = false
    let text: String
    
    var body: some View {
        HStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 50,height: 50)
            Text(text)
            Spacer()
            
            Text("Change")
                .underline()
                .fontWeight(.semibold)
                .onTapGesture {
                    isSheetPresented = true // Show the sheet when "Change" is tapped
                }
           
        }
        .padding(.horizontal)
        .frame(height: 70)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
        
        .shadow(radius: 2)
        
       
//        .padding()
//        .padding(.horizontal)
       
        
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(text: "Saved to trendings")
    }
}
