//
//  StorageManager.swift
//  SeroFero
//
//  Created by Rishi on 11/10/2023.
//


import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    //MARK: - For Both Profile and Place Images
    private let storage = Storage.storage().reference()
    
    private var imagesReference: StorageReference {
        storage.child("images")
    }
    
    
    //MARK: - Storing Images for User Profile
    private func userReference(userId: String) -> StorageReference {
        storage.child("users").child(userId)
    }
    
    func getPathForImage(path: String) -> StorageReference {
        Storage.storage().reference(withPath: path)
    }
    
    func getUrlForImage(path: String) async throws -> URL {
        try await getPathForImage(path: path).downloadURL()
    }
    
    func getData(userId: String, path: String) async throws -> Data {
        //try await userReference(userId: userId).child(path).data(maxSize: 3 * 1024 * 1024)
        try await storage.child(path).data(maxSize: 3 * 1024 * 1024)
    }
    
    func getImage(userId: String, path: String) async throws -> UIImage {
        let data = try await getData(userId: userId, path: path)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        
        return image
    }
    // Update the saveImage method to accept folderName and fileName
    func saveProfileImage(data: Data, userId: String, folderName: String, fileName: String) async throws -> (path: String, name: String) {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(folderName)/\(fileName).jpeg"
        let returnedMetaData = try await userReference(userId: userId).child(path).putDataAsync(data, metadata: meta)
        
        guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
            throw URLError(.badServerResponse)
        }
        
        return (returnedPath, returnedName)
    }
    func saveProfileImage(image: UIImage, userId: String) async throws -> (path: String, name: String) {
        // image.pngData()
        guard let data = image.jpegData(compressionQuality: 1) else {
            throw URLError(.backgroundSessionWasDisconnected)
        }
        
        let folderName = "profile_images" // Set the desired folder name
        let fileName = userId // Use a unique file name (e.g., user's UID)
        return try await saveProfileImage(data: data, userId: userId, folderName: folderName, fileName: fileName)
    }
    
    func deleteImage(path: String) async throws {
        try await getPathForImage(path: path).delete()
    }
    
    
    //MARK: - Storing Images for Places
    private func placeReference(placeId: String) -> StorageReference {
        storage.child("places").child(placeId)
        }
    
    func getPathForPlaceImage(path: String) -> StorageReference {
        Storage.storage().reference(withPath: path)
    }
    func getUrlForPlaceImage(path: String) async throws -> URL {
        try await getPathForPlaceImage(path: path).downloadURL()
    }
    
    func getData(placeId: String, path: String) async throws -> Data {
        //try await userReference(userId: userId).child(path).data(maxSize: 3 * 1024 * 1024)
        try await storage.child(path).data(maxSize: 3 * 1024 * 1024)
    }
    
    
    func getPlaceImage(placeId: String, path: String) async throws -> UIImage {
        let data = try await getData(placeId: placeId, path: path)
        
        guard let image = UIImage(data: data) else {
            throw URLError(.badServerResponse)
        }
        
        return image
    }
    
    func savePlaceImage(data: Data, placeId: String, folderName: String, fileName: String) async throws -> (path: String, name: String) {
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        // Use placeId and fileName to create a path with folders
        let path = "\(folderName)/\(fileName).jpeg" // Corrected path construction
        
        print("Attempting to save image for placeId: \(placeId)")
        
        do {
            let returnedMetaData = try await placeReference(placeId: placeId).child(path).putDataAsync(data, metadata: meta)
            
            print("Image saved to storage successfully")
            
            guard let returnedPath = returnedMetaData.path, let returnedName = returnedMetaData.name else {
                throw URLError(.badServerResponse)
            }
            
            return (returnedPath, returnedName)
        } catch {
            print("Error saving image to storage: \(error)")
            throw error
        }
    }

    func savePlaceImage(image: UIImage, placeId: String) async throws -> (path: String, name: String) {
        // image.pngData()
        guard let data = image.jpegData(compressionQuality: 1) else {
            throw URLError(.backgroundSessionWasDisconnected)
        }
        
        let folderName = "place_images" // Set the desired folder name
        let fileName = placeId // Use a unique file name (e.g., user's UID)
        return try await savePlaceImage(data: data, placeId: placeId, folderName: folderName, fileName: fileName)
    }
    
}
