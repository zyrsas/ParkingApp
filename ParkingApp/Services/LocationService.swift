//
//  LocationService.swift
//  ParkingApp
//
//  Created by Sasha on 5/13/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import CoreLocation
import UserNotifications
import GoogleMaps

class LocationService: NSObject, CLLocationManagerDelegate {

    let center = UNUserNotificationCenter.current()
    let locationManager = CLLocationManager()
    var latitude: Double = 0.0
    var longtitude: Double = 0.0
    var parkingViewModel = ParkingViewModel()

    static let shared = LocationService()

    private override init () {
        super.init()
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }

    func locationManager(_ manager: CLLocationManager, didVisit visit: CLVisit) {
        // create CLLocation from the coordinates of CLVisit
        let clLocation = CLLocation(latitude: visit.coordinate.latitude, longitude: visit.coordinate.longitude)

        print(clLocation)
        // Get location description
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last!

        self.latitude = lastLocation.coordinate.latitude
        self.longtitude = lastLocation.coordinate.longitude
        print(lastLocation)

        print(self.checkUserInsidePolygone(position: lastLocation.coordinate))
    }

    func checkUserInsidePolygone(position: CLLocationCoordinate2D) -> Bool {
        for parking in parkingViewModel.getPolygonsPath() {
            if GMSGeometryContainsLocation(position, parking, true) {
                print("TRUE")
                WaitingService.shared.startTimeParking()

                return true
            } else {
                print("NO")
                WaitingService.shared.stopTimeParking()

                return false
            }

        }
        return false
    }
}
