//
//  DeveloperPreview.swift
//  SeroFero
//
//  Created by Rishi on 08/10/2023.
//

import Foundation
import SwiftUI

extension PreviewProvider{
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}
class DeveloperPreview {
    static  let shared = DeveloperPreview()
    let user  = DBUser(userId: NSUUID().uuidString, userName: "Ram", email: "rishi@gmail.com")
}
