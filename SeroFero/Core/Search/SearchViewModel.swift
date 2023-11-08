//
//  SearchViewModel.swift
//  SeroFero
//
//  Created by Rishi on 10/10/2023.
//

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var users = [DBUser]()
    
    init() {
        Task {
            try await fetchAllUsers()
        }
    }
    
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
