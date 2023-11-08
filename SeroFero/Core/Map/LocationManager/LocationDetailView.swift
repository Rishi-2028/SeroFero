//
//  LocationDetailView.swift
//  SeroFero
//
//  Created by Rishi on 01/10/2023.
//

//import SwiftUI
//import MapKit
//
//struct LocationDetailView: View {
//    
//    @ObservedObject var locationManager = LocationManager()
//    @Binding var  location: CLPlacemark?
//    @Binding var isShowingMapView: Bool
//    
//    
//    var body: some View {
//        VStack(spacing: 15) {
//            Text("Confirm Location")
//                .font(.title2.bold())
//            
//            HStack(spacing: 15) {
//                Image(systemName: "mappin.circle.fill")
//                    .font(Font.system(size: 30))
//                    .foregroundStyle(Color.gray)
//                
//                VStack(alignment: .leading, spacing: 6) {
//                    Text("Name: \(location?.name ?? "")")
//                    
//                    Text("Locality: \(location?.locality ?? "")")
//                    Text("Place: \(location?.thoroughfare ?? "")")
//                }
//                .padding(.horizontal)
//            }
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .padding(.vertical, 10)
//
//            Button(action: {
//                // Confirm the location and update the @Published property in LocationManager
//                Task {
//                    locationManager.confirmedLocation = locationManager.selectedLocation
//                    isShowingMapView = false // Dismiss the map view
//                }
//             
//            }, label: {
//                Text("Confirm Location")
//                    .fontWeight(.bold)
//                    .frame(maxWidth: .infinity)
//                    .padding(.vertical, 12)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(.green)
//                    )
//                    .foregroundColor(.white)
//            })
//        }
//        .padding()
//        .background(
//            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                .fill(.white)
//        )
//        .frame(maxHeight: .infinity, alignment: .bottom)
//    }
//}
//
//
//#Preview {
//    LocationDetailView(locationManager: LocationManager(), location: .constant(nil), isShowingMapView: .constant(false))
//}
