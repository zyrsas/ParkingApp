//
//  ParkingViewModel.swift
//  ParkingApp
//
//  Created by Sasha on 5/14/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import CoreLocation
import GoogleMaps

protocol ParkingViewModelProtocol {
    var parkings: [ParkingModel] { get }
    func getPolygonsPath() -> [GMSMutablePath]
    func getCenterParking() -> [CLLocationCoordinate2D]
}

class ParkingViewModel: ParkingViewModelProtocol {

    var parkings: [ParkingModel] = {
        return [
                    ParkingModel(center: CLLocationCoordinate2D(latitude: 50.452342, longitude: 30.520033),
                                 points: [
                                    CLLocationCoordinate2D(latitude: 50.451393, longitude: 30.521760),
                                    CLLocationCoordinate2D(latitude: 50.452240, longitude: 30.518477),
                                    CLLocationCoordinate2D(latitude: 50.453128, longitude: 30.520065),
                                    CLLocationCoordinate2D(latitude: 50.451393, longitude: 30.521760)
                                 ],
                                 name: "Some Parking",
                                 description: "Description"),

                    ParkingModel(center: CLLocationCoordinate2D(latitude: 50.450668, longitude: 30.519389),
                                 points: [
                                    CLLocationCoordinate2D(latitude: 50.451789, longitude: 30.518434),
                                    CLLocationCoordinate2D(latitude: 50.449719, longitude: 30.517490),
                                    CLLocationCoordinate2D(latitude: 50.449623, longitude: 30.520129),
                                    CLLocationCoordinate2D(latitude: 50.451249, longitude: 30.521749),
                                    CLLocationCoordinate2D(latitude: 50.451789, longitude: 30.518434)
                                 ],
                                 name: "Some Parking 2",
                                 description: "Description 2"),

                    ParkingModel(center: CLLocationCoordinate2D(latitude: 50.450026, longitude: 30.521943),
                                 points: [
                                    CLLocationCoordinate2D(latitude: 50.450675, longitude: 30.521964),
                                    CLLocationCoordinate2D(latitude: 50.450046, longitude: 30.520913),
                                    CLLocationCoordinate2D(latitude: 50.449390, longitude: 30.522651),
                                    CLLocationCoordinate2D(latitude: 50.450135, longitude: 30.522930),
                                    CLLocationCoordinate2D(latitude: 50.450675, longitude: 30.521964)
                                 ],
                                 name: "Some Parking 3",
                                 description: "Description 3")
            ]
    }()

    func getPolygonsPath() -> [GMSMutablePath] {
        var polygons: [GMSMutablePath] = []

        for park in parkings {
            let path = GMSMutablePath()
            for poin in park.points {
                path.add(poin)
            }
            polygons.append(path)
        }
        return polygons
    }

    func getCenterParking() -> [CLLocationCoordinate2D] {
        var centerParkings: [CLLocationCoordinate2D] = []
        for parkCenter in parkings {
            centerParkings.append(parkCenter.center)
        }

        return centerParkings
    }
}
