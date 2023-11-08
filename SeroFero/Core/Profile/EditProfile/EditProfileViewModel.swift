//
//  EditProfileViewModel.swift
//  SeroFero
//
//  Created by Rishi on 10/10/2023.
//


import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    private let storageManager: StorageManager
    private let userManager: UserManager

    @Published var user: DBUser
    @Published var selectedImage: PhotosPickerItem? {
        didSet {
            // When selectedImage is set, load and set the profileImage
            Task {
                try? await updateProfile()
            }
        }
    }

    @Published var profileImage: Image?
    @Published var userName: String = ""
    @Published var bio: String = ""

    init(user: DBUser, storageManager: StorageManager, userManager: UserManager) {
        self.user = user
        self.storageManager = storageManager
        self.userManager = userManager
        self.userName = user.userName
        self.bio = user.bio ?? ""
    }

    
    func updateUserData() async throws {
        guard Auth.auth().currentUser != nil else {
            throw EditProfileError.userNotAuthenticated
        }
        
        try await userManager.updateProfile(userName: userName, bio: bio)
        try await updateProfile()
    }
    
    func updateProfile() async throws {
        guard let item = selectedImage else {
            throw EditProfileError.imageDataLoadFailed
        }

        // Extract the image data from the PhotosPickerItem using loadTransferable
        guard let imageData = try? await item.loadTransferable(type: Data.self) else {
            throw EditProfileError.imageDataLoadFailed
        }

        let folderName = "profile_images"
        let fileName = user.userId

        let (path, _) = try await storageManager.saveProfileImage(data: imageData, userId: user.userId, folderName: folderName, fileName: fileName)
        let url = try await storageManager.getUrlForImage(path: path)

        // Set the profileImage after the image is successfully saved
        self.profileImage = Image(uiImage: UIImage(data: imageData) ?? UIImage())

        try await userManager.updateUserProfileImagePath(userId: user.userId, url: url.absoluteString)
    }



}

enum EditProfileError: Error {
    case userNotAuthenticated
    case imageDataLoadFailed
}
