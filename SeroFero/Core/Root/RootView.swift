//
//  RootView.swift
//  SeroFero
//
//  Created by Rishi on 06/10/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = RootViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInWithGoogleView()
                 
            } else if let currentUser = viewModel.currentUser  {
                TabBarView(user: currentUser)
            }
        }
    }
}

#Preview {
    RootView()
}
