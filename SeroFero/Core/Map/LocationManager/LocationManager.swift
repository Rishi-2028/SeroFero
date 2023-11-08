//
//  LocationManager.swift
//  SeroFero
//
//  Created by Rishi on 01/10/2023.
//
//import Foundation
//import MapKit
//import CoreLocation
//import SwiftUI
//
//
//@MainActor
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
//    
//    //MARK: - Properties
//    
//    // The CLLocationManager instance
//        private var locationManager = CLLocationManager()
//    
//  
//    
//    //MARK: - Search
//    @Published var searchResults = [CLPlacemark]()
//    @Published var searchText = ""
//    
//    //MARK: - User Location
//    @Published var cameraPosition: MapCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
//    @Published var selectedLocation: CLPlacemark?
//    @Published var confirmedLocation: CLPlacemark?
//    @Published var visibleRegion: MKCoordinateRegion?
//    @Published var userLocation: CLLocation?
//    
//    
//    //MARK: - Route
//    @Published var route: MKRoute?
//    
//    override init() {
//        super.init()
//        setupLocationManager()
//    }
//    
//    private func setupLocationManager() {
//        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.startUpdatingLocation()
//        locationManager.requestWhenInUseAuthorization()
//    }
//    
//    //MARK: - Location Authorization
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        switch status {
//        case .notDetermined:
//            manager.requestWhenInUseAuthorization()
//        case .restricted:
//            manager.stopUpdatingLocation()
//        case .denied:
//            handleLocationError()
//        case .authorizedAlways, .authorizedWhenInUse:
//            // Permission granted, continue
//            break
//        @unknown default:
//            break
//        }
//    }
//    
//    func handleLocationError() {
//        // Handle location-related errors here
//    }
//    
//    //MARK: - Location Updates
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let currentLocation = locations.last {
//            userLocation = currentLocation
//        }
//    }
//    func userDidSelectLocation(_ location: CLPlacemark) {
//        selectedLocation = location
//    }
//
//
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print("Location manager error: \(error.localizedDescription)")
//    }
//    
//    //MARK: - Search Places
//    func searchPlaces() async {
//        let request = MKLocalSearch.Request()
//        request.naturalLanguageQuery = searchText
//        request.resultTypes = .pointOfInterest
//        
//        // Define the bounding box that encompasses Nepal more accurately
//        let nepalCoordinates = [
//            CLLocationCoordinate2D(latitude: 26.347, longitude: 80.058), // Westernmost point
//            CLLocationCoordinate2D(latitude: 30.447, longitude: 88.201), // Easternmost point
//            CLLocationCoordinate2D(latitude: 30.447, longitude: 80.058), // Northernmost point
//            CLLocationCoordinate2D(latitude: 26.347, longitude: 88.201)  // Southernmost point
//        ]
//        
//        let nepalPolygon = MKPolygon(coordinates: nepalCoordinates, count: nepalCoordinates.count)
//        request.region = MKCoordinateRegion(nepalPolygon.boundingMapRect)
//        
//        do {
//            let response = try await MKLocalSearch(request: request).start()
//            searchResults = response.mapItems.compactMap { $0.placemark }
//        } catch {
//            // Handle search errors
//        }
//    }
//    
//    //MARK: - Reverse Geocoding
//    func reverseGeocode(location: CLLocation) async {
//        let geocoder = CLGeocoder()
//        do {
//            let placemarks = try await geocoder.reverseGeocodeLocation(location)
//            if let placemark = placemarks.first {
//                selectedLocation = placemark
//            }
//        } catch {
//            // Handle geocoding errors
//        }
//    }
//    
//}
