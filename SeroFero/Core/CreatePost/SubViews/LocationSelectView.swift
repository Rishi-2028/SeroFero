//
//  LocationSelectView.swift
//  SeroFero
//
//  Created by Rishi on 04/10/2023.
//

//import SwiftUI
//
//struct LocationSelectView: View {
//    @StateObject var locationManager = LocationManager()
//    @State private var isShowingMapView = false
//    @State var showLocationDetails = false
//    var body: some View {
//        
//        NavigationStack {
//            VStack {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(.white)
//                        .frame(height: 40)
//                        .shadow(radius: 10)
//                    
//                    HStack {
//                        Text(locationManager.confirmedLocation?.name ?? "Location")
//                        
//                        
//                        Spacer()
//                        
//                        Button(action: {
//                            isShowingMapView.toggle()
//                        }) {
//                            Image(systemName: "mappin.circle")
//                        }
//                    }
//                    .padding()
//                }
//                .padding()
//                
//            }
//        }
//        .sheet(isPresented: $isShowingMapView) {
//            MapView(locationManager: locationManager, showLocationDetails: $showLocationDetails, isShowingMapView: $isShowingMapView, location: $locationManager.confirmedLocation)
//        }
//        
//    }
//}
//
//#Preview {
//    LocationSelectView()
//}
