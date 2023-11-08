//
//  SignInGoogleHelper.swift
//  SeroFero
//
//  Created by Rishi on 06/10/2023.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift
import Firebase


struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String
    let name: String?
    let email: String?
    let photoUrl: String?
    init(idToken: String, accessToken: String, name: String?, email: String?, photoUrl: String?) {
        self.idToken = idToken
        self.accessToken = accessToken
        self.name = name
        self.email = email
        self.photoUrl = photoUrl
     
        
    }
}

final class SignInGoogleHelper {
   
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC =  Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }

        
       let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString  else {
            throw URLError(.badServerResponse)
        }
        let accessToken = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email
        let photoUrl = gidSignInResult.user.profile?.imageURL(withDimension: 200)?.absoluteString
        let tokens = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken,name: name, email: email, photoUrl: photoUrl)
        return tokens
    }
}
