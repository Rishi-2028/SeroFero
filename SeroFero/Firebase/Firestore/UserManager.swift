//
//  UserManager.swift
//  SeroFero
//
//  Created by Rishi on 05/10/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth
import Combine



struct DBUser: Codable {
    let userId: String
    let userName: String
    let email: String
    let photoUrl: String?
    let bio: String?
    let dateCreated: Date?
    let isVerified: Bool?
    let profileImagePathUrl: String?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == userId
    }

  
    
    init(
        userId: String,
        userName: String,
        email: String,
        photoUrl: String? = nil,
        bio: String? = nil,
        dateCreated: Date? = nil,
        isVerified: Bool? = false,
        profileImagePath: String? = nil,
        profileImagePathUrl: String? = nil
    ) {
        self.userId = userId
        self.userName = userName
        self.email = email
        self.photoUrl = photoUrl
        self.bio = bio
        self.dateCreated = dateCreated
        self.isVerified = isVerified
        self.profileImagePathUrl = profileImagePathUrl
    }
    

    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case userName = "user_name"
        case email = "email"
        case photoUrl = "photo_url"
        case bio = "bio"
        case dateCreated = "date_created"
        case isVerified = "user_isVerified"
        case profileImagePathUrl = "profile_image_path_url"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.userName = try container.decode(String.self, forKey: .userName) 
        self.email = try container.decode(String.self, forKey: .email)
        self.photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        self.bio = try container.decodeIfPresent(String.self, forKey: .bio)
        self.dateCreated = try container.decodeIfPresent(Date.self, forKey: .dateCreated)
        self.isVerified = try container.decodeIfPresent(Bool.self, forKey: .isVerified)
        self.profileImagePathUrl = try container.decodeIfPresent(String.self, forKey: .profileImagePathUrl)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.userName, forKey: .userName)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.photoUrl, forKey: .photoUrl)
        try container.encodeIfPresent(self.bio, forKey: .bio)
        try container.encodeIfPresent(self.dateCreated, forKey: .dateCreated)
        try container.encodeIfPresent(self.isVerified, forKey: .isVerified)
        try container.encodeIfPresent(self.profileImagePathUrl, forKey: .profileImagePathUrl)
    }
    
}


final class UserManager {
    
    
    
    private let userCollection: CollectionReference = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        //        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        //        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
        private var userProfileListener: ListenerRegistration? = nil
    
    func createNewUser(user: DBUser) async throws {
        try userDocument(userId: user.userId).setData(from: user, merge: false)
    }
    
    
    
    func getUser(userId: String) async throws -> DBUser {
        try await userDocument(userId: userId).getDocument(as: DBUser.self)
    }
    
    // Update Profile in firestore
    func updateProfile( userName: String, bio: String) async throws {
        if let user = Auth.auth().currentUser {
            let userId = user.uid
            // Create a dictionary to store the fields to update
            var data: [String: Any] = [
                DBUser.CodingKeys.userName.rawValue:  userName,
                DBUser.CodingKeys.bio.rawValue: bio
            ]
            
            
            // Update the Firestore document with the new data
            try await userDocument(userId:userId ).updateData(data)
        }
    }
  
  

    
    
    
    func updateUserProfileImagePath(userId: String, url: String?) async throws {
        let data: [String:Any] = [
         
            DBUser.CodingKeys.profileImagePathUrl.rawValue : url as Any,
        ]
        
        try await userDocument(userId: userId).updateData(data)
    }
    
}

