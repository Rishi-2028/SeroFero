//
//  SettingsView.swift
//  SeroFero
//
//  Created by Rishi on 19/09/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SectionHeader(sectionTitle: "Travel Essentials")
            SettingList(icon: "phone", name: "Emergency Contacts", backgroundColor: .green)
            SettingList(icon: "map", name: "Maps & Guides", backgroundColor: .blue)
            SettingList(icon: "sun.haze", name: "Weather", backgroundColor: .orange)
            
            Divider()
            SectionHeader(sectionTitle: "General Setting")
            SettingList(icon: "key", name: "Setting", backgroundColor: .red)
            SettingList(icon: "person.badge.plus", name: "Follow and Invite Friends", backgroundColor: .cyan)
            SettingList(icon: "bell", name: "Notification", backgroundColor: .green)
            
            Button(action: {
                AuthService.shared.signOut()
            }, label: {
                SettingList(icon: "rectangle.portrait.and.arrow.right", name: "LogOut", backgroundColor: .red)
            })
           
        }
        .padding(.horizontal, 8)
        
        
        
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
struct SettingList: View {
    let icon: String
    let name: String
    let backgroundColor: Color
//    var action: () -> Void // Add a closure to define the action

    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .background(backgroundColor)
                .cornerRadius(7)
            
            Text(name)
                .font(.headline)
        }
        .padding(.vertical, -12)
        .padding()
//        .onTapGesture {
//            // Perform the defined action when tapped
//            action()
//        }
    }
}

struct SectionHeader: View {
    let sectionTitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Section(header: Text(sectionTitle).bold()) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(maxWidth: .infinity)
                    .frame(height: 4)
            }
        }
        .padding(.horizontal)
        .fixedSize(horizontal: true, vertical: false)
        
    }
}
