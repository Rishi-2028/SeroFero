//
//  SignInWithGoogleViewmodel.swift
//  SeroFero
//
//  Created by Rishi on 09/10/2023.
//

import Foundation
import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

@MainActor
final class SignInWithGoogleViewmodel: ObservableObject {
    
    @Published var name: String = ""
     @Published var email: String = ""
    @Published var photoURL: String = ""

    private let userManager: UserManager
    private let signInGoogleHelper: SignInGoogleHelper

  
    
    init( userManager: UserManager, signInGoogleHelper: SignInGoogleHelper ) {
       
        self.userManager = userManager
        self.signInGoogleHelper = signInGoogleHelper
        
    }
    
    func signInGoogle() async throws {
        do {
            let tokens = try await signInGoogleHelper.signIn()
            // Store name and email from Google sign-in
            name = tokens.name ?? ""
            email = tokens.email ?? ""
            photoURL = tokens.photoUrl ?? ""
            let _ = try await AuthService.shared.signInWithGoogle(tokens: tokens)
          
        } catch {
            throw error
        }
    }



}
