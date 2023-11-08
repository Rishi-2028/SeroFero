//
//  CircularProfileImage.swift
//  SeroFero
//
//  Created by Rishi on 14/09/2023.
//

import SwiftUI
import Kingfisher




enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

enum SystemNameSize {
    
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .small: return 20
        case .medium:
            return 30
        case .large:
            return 40
        }
    }
}

@MainActor
struct CircularProfileImage: View {
    let user: DBUser
    
    let iconSize: SystemNameSize
    let size: ProfileImageSize
   
    var body: some View {
        
        if let imageUrl = user.profileImagePathUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
                .foregroundStyle(Color(.systemGray))
               
        }
       
    }
}
struct CircularProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImage( user: dev.user, iconSize: .small, size: .medium)
    }
}
