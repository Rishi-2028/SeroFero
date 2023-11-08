//
//  PlaceManager.swift
//  SeroFero
//
//  Created by Rishi on 05/10/2023.
//

import Foundation


enum SeasonType: String, Codable {
    case summer = "🌞"
    case autumn = "🍁"
    case winter = "☃️"
    case spring = "🌷"

    static var allCases: [SeasonType] {
        return [.summer, .autumn,  .winter, .spring]
        }
}

enum PlaceType: String , Codable {
    case adventurous = "Adventurous 🪂"
    
    case religious = " Religious 🛕"
    
    case festivals = "Festivals 🪔"
    
    case nightLife = "NightLife 🎇"
    
    static var allCases: [PlaceType] {
        return [.adventurous, .religious, .festivals , .nightLife]
    }
}

enum PlaceTypes: Int , CaseIterable , Identifiable{
    case trending
    case sightseeing
    case adventorous
    case trekking
    case lakefront
    case cabins
    case cities
    case camping
    case festivals
    case worldheritage
    case farming
    case caves
    
    
    
    

    var title: String {
        switch self {
        case .trending: return "Trendings"
        case .sightseeing : return "SightSeeing"
        
        case .adventorous:
            return "Adventorous"
        case .trekking:
            return "Trekking"
        case .lakefront:
            return "LakeFront"
        case .cabins:
            return "Cabins"
        case .cities:
            return "Cities"
        case .camping:
            return "Camping"
        case .festivals:
            return "Festivals"
        case .worldheritage:
            return "World Heritage"
        case .farming:
            return "Farming"
        case .caves:
            return "Caves"
        }
    }
    
    var id: Int {return self.rawValue}
}


func iconForPlaceType(_ placeType: PlaceTypes) -> String {
    switch placeType {
    case .trending: return "flame"
    case .sightseeing: return "eye"
    case .adventorous: return "mountain.2"
    case .trekking: return "figure.hiking"
    case .lakefront: return "figure.water.fitness"
    case .cabins: return "house"
    case .cities: return "building.2"
    case .camping: return "tent"
    case .festivals: return "music.note"
    case .worldheritage: return "homekit"
    case .farming: return "leaf"
    case .caves: return "square.stack.3d.up.fill"
    }
}

struct Place: Codable, Identifiable  {
    var id: String // Conforming to Identifiable protocol
    let userId: String?
    let placeName: String?
//    let location: GeoPoint?
    let description: String?
    let placeType: String?
    let seasonType: String?
    let rating: Double?
    let likes: Int?
//    let timestamp: Timestamp?
    var images: [PlaceImage]?
    

    init(
        id: String, // Providing default value for id
        userId: String? = nil,
        placeName: String?,
//        location: GeoPoint? = nil,
        description: String? = nil,
        placeType: String? = nil,
        seasonType: String? = nil,
        rating: Double? = nil,
        likes: Int? = nil,
//        timestamp: Timestamp? = nil,
        images: [PlaceImage] = []

        
        
    ) {
        self.id = id // Assigning the provided id or the default value
        self.userId = userId
        self.placeName = placeName
//        self.location = location
        self.description = description
        self.placeType = placeType
        self.seasonType = seasonType
        self.rating = rating
        self.likes = likes
//        self.timestamp = timestamp
        self.images = images

    }
    
    

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "user_id"
        case placeName = "place_name"
//        case location = "location"
        case description = "description"
        case placeType = "place_type"
        case seasonType = "season_type"
        case rating = "rating"
        case likes = "likes"
//        case timestamp = "timestamp"
        case images = "images"

        
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.placeName = try container.decode(String.self, forKey: .placeName)
//        self.location = try container.decodeIfPresent(GeoPoint.self, forKey: .location)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.placeType = try container.decodeIfPresent(String.self, forKey: .placeType)
        self.seasonType = try container.decodeIfPresent(String.self, forKey: .seasonType)
        self.rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        self.likes = try container.decodeIfPresent(Int.self, forKey: .likes)
//        self.timestamp = try container.decodeIfPresent(Timestamp.self, forKey: .timestamp)
        self.images = try container.decodeIfPresent([PlaceImage].self, forKey: .images)


    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.userId, forKey: .userId)
        try container.encode(self.placeName, forKey: .placeName)
//        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.placeType, forKey: .placeType)
        try container.encodeIfPresent(self.seasonType, forKey: .seasonType)
        try container.encodeIfPresent(self.rating, forKey: .rating)
        try container.encodeIfPresent(self.likes, forKey: .likes)
//        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.images, forKey: .images)


    }
}

struct PlaceImage: Codable, Identifiable {
    var id: String // Firestore document ID (auto-generated)
    let imagePath: String? // Path to the image in Firebase Storage
    let imageUrl: String? // URL of the image
    let dateAdded: Date? // Date when the image was added

    
    init(id: String, imagePath: String, imageUrl: String, dateAdded: Date) {
        self.id = id
        self.imagePath = imagePath
        self.imageUrl = imageUrl
        self.dateAdded = dateAdded
    }
   
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imagePath = "image_path"
        case imageUrl = "image_url"
        case dateAdded = "date_added"
    }
}
