//
//  SignInWithGoogleView.swift
//  SeroFero
//
//  Created by Rishi on 06/10/2023.
//

import SwiftUI

struct SignInWithGoogleView: View {
    @StateObject private var viewModel: SignInWithGoogleViewmodel
    init() {
            let signInGoogleHelper = SignInGoogleHelper()
            let userManager = UserManager()
            self._viewModel = StateObject(wrappedValue: SignInWithGoogleViewmodel(
                userManager: userManager, signInGoogleHelper: signInGoogleHelper
            ))
        }
    
    var body: some View {
        VStack {
            Button(action: {
                Task {
                    try? await viewModel.signInGoogle()
                }
               
            }) {
                HStack {
                    Image(systemName: "g.circle.fill")
                        .font(.title)
                    Text("Continue with Google")
                        .font(.headline)
                }
                .padding()
                .background(Color.blue) // Use an appropriate color
                .foregroundColor(.white)
                .cornerRadius(8) // Add rounded corners for the button
            }
            .buttonStyle(.bordered) // Apply the bordered button style
        }
    }
}


#Preview {
    SignInWithGoogleView()
}
