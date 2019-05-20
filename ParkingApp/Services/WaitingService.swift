//
//  WaitingService.swift
//  ParkingApp
//
//  Created by Sasha on 5/13/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

class WaitingService {

    // MARK: - Properties
    private var timer: Timer?
    private var onParking: Bool = false
    private var counter: Int = 0

    static let shared = WaitingService()

    private init() {
    }

    @objc
    func timerCall() {
        counter += 1
        print(counter)
        if counter == 180 {
            print("parked")
            onParking = true
            stopTimeParking()
        }
    }

    func startTimeParking() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCall), userInfo: nil, repeats: true)
        timer?.fire()
    }

    func stopTimeParking() {
        timer?.invalidate()
        timer = nil
        counter = 0
    }
}
