//
//  AuthService.swift
//  SeroFero
//
//  Created by Rishi on 06/10/2023.
//


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
final class AuthService {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: DBUser?

    static let shared = AuthService()

    init() {
        Task {
           try await loadUserData()
        }
    }

    func signOut() {
        try? Auth.auth().signOut() // Sign out from the backend
        self.userSession = nil // This removes the session locally and updates routing
    }
    
    
}

// MARK: - Single sign-on (SSO) (SignInWithGoogle)
extension AuthService {
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> User {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }

    func signIn(credential: AuthCredential) async throws -> User {
        do {
            // Attempt to sign in with the provided AuthCredential
            let result = try await Auth.auth().signIn(with: credential)
            
            // Get the authenticated user from the AuthDataResult
            let user = result.user
            // Update the userSession property with the authenticated user
            self.userSession = user
            print("DEBUG: Did Create user...")
            await self.uploadUserData(uid: result.user.uid, userName: result.user.displayName ?? "", email: result.user.email ?? "")
            print("DEBUG: Did Upload User Data")
            
            return user // Return the authenticated user
        } catch {
            // Handle the sign-in error if there is one
            throw error // Throw the error to be handled by the caller
        }
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = userSession?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        print("DEBUG: Snapshot data is \(String(describing: snapshot.data()))")
        self.currentUser = try? snapshot.data(as: DBUser.self)
        
    }
    
    private func uploadUserData(uid: String, userName: String, email: String) async {
        let user = DBUser(userId: uid, userName: userName, email: email)
        self.currentUser = user
        guard let  encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await Firestore.firestore().collection("users").document(user.userId).setData(encodedUser)
        
    }

}
