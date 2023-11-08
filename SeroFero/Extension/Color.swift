//
//  Color.swift
//  SeroFero
//
//  Created by Rishi on 18/09/2023.
//

import Foundation
import SwiftUI
extension Color {
    static func randomHue(saturation: Double = 1.0, brightness: Double = 1.0, alpha: Double = 1.0) -> Color {
        let hue = Double.random(in: 0...1)
        return Color(UIColor(hue: CGFloat(hue), saturation: CGFloat(saturation), brightness: CGFloat(brightness), alpha: CGFloat(alpha)))
    }
}
