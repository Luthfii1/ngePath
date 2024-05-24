//
//  LocationManager.swift
//  ngePath
//
//  Created by Luthfi Misbachul Munir on 24/05/24.
//

import Foundation
import MapKit

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    @Published var manager: CLLocationManager = .init()
    @Published var userLocation: CLLocationCoordinate2D = .init(latitude: -6.303338, longitude: 106.638168)
    @Published var isLocationAuthorized: Bool = false
    
    override init() {
        super.init()
        
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else{return}
        
        print(currentLocation)
        
        userLocation = .init(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        isLocationAuthorized = true
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        checkAuthorization()
    }
    
    func checkAuthorization(){
        switch manager.authorizationStatus {
        case .notDetermined:
            print("Location is not determined")
            manager.requestWhenInUseAuthorization()
        case .denied:
            print("Location is denied")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Location permission done")
            manager.requestLocation()
        default:
            break;
        }
    }
}
