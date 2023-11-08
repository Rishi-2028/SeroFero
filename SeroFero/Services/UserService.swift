//
//  UserService.swift
//  SeroFero
//
//  Created by Rishi on 10/10/2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
 
    static func fetchAllUsers() async throws -> [DBUser] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: DBUser.self) })
        
       
        
    }
}
