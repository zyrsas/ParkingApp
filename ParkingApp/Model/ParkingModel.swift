//
//  ParkingModel.swift
//  ParkingApp
//
//  Created by Sasha on 5/13/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation
import CoreLocation

struct ParkingModel {
    let center: CLLocationCoordinate2D
    let points: [CLLocationCoordinate2D]
    let name: String
    let description: String
}
