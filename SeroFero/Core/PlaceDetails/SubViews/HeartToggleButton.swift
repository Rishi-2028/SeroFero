//
//  HeartToggleButton.swift
//  SeroFero
//
//  Created by Rishi on 05/10/2023.
//

import SwiftUI

struct HeartToggleButton: View {
    @Binding var isHeartButtonTapped: Bool
    @Binding var isCreateWishlistViewPresented: Bool

    var body: some View {
        Button(action: {
            isHeartButtonTapped.toggle()
            if isHeartButtonTapped {
                withAnimation {
                    isCreateWishlistViewPresented.toggle()
                }
            }
        }) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 40, height: 40)
                
                Image(systemName:  isHeartButtonTapped ? "heart.fill" : "heart")
                    .foregroundColor(isHeartButtonTapped ? .red : .black)
                    .font(Font.system(size: 15))
            }
        }
    }
}

#Preview {
    HeartToggleButton(isHeartButtonTapped: .constant(false), isCreateWishlistViewPresented: .constant(false))
}
