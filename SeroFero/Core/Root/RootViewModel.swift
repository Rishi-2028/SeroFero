//
//  RootViewModel.swift
//  SeroFero
//
//  Created by Rishi on 06/10/2023.
//

import Foundation
import Combine
import SwiftUI
import Firebase
import FirebaseAuth



@MainActor
final class RootViewModel: ObservableObject {
    private let authservice = AuthService.shared
    private var cancellables = Set<AnyCancellable> ()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: DBUser?
    
    
    
    init() {
        setupSubscribers()
    }
    
    private func  setupSubscribers() {
        authservice.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }
        .store(in: &cancellables)
        
        authservice.$currentUser.sink { [weak self] currentUser in
            self?.currentUser = currentUser
        }
        .store(in: &cancellables)
    }
    
    
}

