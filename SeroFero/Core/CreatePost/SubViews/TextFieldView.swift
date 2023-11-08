//
//  TextFieldView.swift
//  SeroFero
//
//  Created by Rishi on 04/10/2023.
//

import SwiftUI



struct TextFieldView: View {
     var title = ""
    @State private var text = ""
    var body: some View {
        VStack {
            TextField(title, text: $text)
                .font(.subheadline)
                .padding()
                .padding(.horizontal, 8)
                .frame(height: 50)
                .background(Color.white)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
            )
              
        }
        .padding()
        .padding(.bottom)
    }
}

#Preview {
    TextFieldView()
}
