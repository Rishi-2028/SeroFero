//
//  MapView.swift
//  SeroFero
//
//  Created by Rishi on 01/10/2023.
//
//
//import SwiftUI
//import MapKit
//
//@available(iOS 17.0, *)
//struct MapView: View {
//    @ObservedObject var locationManager = LocationManager()
//    @Binding var showLocationDetails: Bool
//    @Binding var isShowingMapView: Bool
//    @Binding var location: CLPlacemark?
//    @Environment(\.dismiss) var dismiss
//
//    var body: some View {
//        NavigationStack {
//            ZStack() {
//                Map(position: $locationManager.cameraPosition, selection: $locationManager.selectedLocation) {
//                    // Display user's current location as a single annotation
//                    if let location = locationManager.userLocation {
//                        Annotation("My Location", coordinate: location.coordinate) {
//                            Button(action: {
//                                
//                                    locationManager.userLocation = location // Store the user's CLLocation
//                                
//                                locationManager.userLocation = location // Store the user's CLLocation
//                               
//                                Task {
//                                    await locationManager.reverseGeocode(location: location) // Reverse geocode the location
//                                }
//                                showLocationDetails = (locationManager.selectedLocation != nil)
//                            }) {
//                                ZStack {
//                                    Circle()
//                                        .frame(width: 32, height: 32)
//                                        .foregroundColor(.blue.opacity(0.3))
//                                    Circle()
//                                        .frame(width: 20, height: 20)
//                                        .foregroundColor(.white)
//                                    Circle()
//                                        .frame(width: 12, height: 12)
//                                        .foregroundColor(.blue)
//                                }
//                            }
//                        }
//                    }
//                    ForEach(locationManager.searchResults, id: \.self) { place in
//                        Marker(place.name ?? "", coordinate: place.location?.coordinate ?? CLLocationCoordinate2D())
//                    }
//                   
//                }
////                .ignoresSafeArea(.container) // Ignore the top safe area
//             
//               
//                VStack {
//                    HStack {
//                        MapSearchView(searchText: $locationManager.searchText)
//                            .onSubmit(of: .text) {
//                                Task {
//                                    await locationManager.searchPlaces()
//                                }
//                            }
//                        
//                        Spacer()
//                        
//                        Button("Cancel") {
//                           dismiss()
//                        }
//                        .padding(.trailing)
//                    }
//                    .padding(.top, 20)
//                    .background(Color.white) // Fixed bar background
//                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
//                    .frame(height: 20) // Adjust the height of the fixed bar
//                    Spacer()
//                }
//               
//                    VStack(alignment: .center) {
//                        MapUserLocationButton()
//                    }
//                    
//           
//         
//                       
//
//
//            
//            
//                 
////                MapSearchView(searchText: $locationManager.searchText)
////                    .onSubmit(of: .text) {
////                        Task {
////                            await locationManager.searchPlaces()
////                        }
////                    }
//                    
//                    .onChange(of: locationManager.searchResults) { _, _ in
//                        locationManager.cameraPosition = .automatic
//                    }
//                    .onMapCameraChange { context in
//                        locationManager.visibleRegion = context.region
//                    }
//                    .onChange(of: locationManager.selectedLocation) { _, newValue in
//                        showLocationDetails = newValue != nil
//                    }
//                    .sheet(isPresented: $showLocationDetails, content: {
//                        LocationDetailView(locationManager: locationManager, location: $locationManager.selectedLocation, isShowingMapView: $isShowingMapView)
//                            .presentationDetents([.height(200)])
//                            .presentationDragIndicator(.visible)
//                    })
//            }
////            .toolbar(content: {
////                ToolbarItem {
////                    HStack {
//////                        MapSearchView(searchText: $locationManager.searchText)
//////                            .frame(maxWidth: .infinity)
////                        Spacer()
////                        Text("Cancel")
////                    }
////                }
////            })
//        }
//        
//        
//    }
//}
//
//
//
//#Preview {
//    MapView(locationManager: LocationManager(), showLocationDetails: .constant(false), isShowingMapView: .constant(false), location: .constant(nil))
//}
