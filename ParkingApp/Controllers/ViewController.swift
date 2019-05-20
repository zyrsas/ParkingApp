//
//  ViewController.swift
//  ParkingApp
//
//  Created by Sasha on 5/10/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    // MARK: - Properties

    var parkingViewModel = ParkingViewModel()
    var mainView: ParkingListView!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Create mainView
        mainView = ParkingListView(frame: self.view.bounds)

        // Auto resize mainView
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        // Show mainView
        self.view.addSubview(mainView)

        self.mainView.mapView.isMyLocationEnabled = true

        print(LocationService.shared.locationManager)

        self.makePolygons()
        self.makeParkingCenter()
    }

    func makePolygons() {
        for path in parkingViewModel.getPolygonsPath() {
            let polygon = GMSPolygon(path: path)
            polygon.strokeColor = .black
            polygon.strokeWidth = 5.0
            polygon.fillColor = .lightGray
            polygon.map = mainView.mapView
        }
    }

    func makeParkingCenter() {
        for parking in parkingViewModel.parkings {
            let marker = GMSMarker(position: parking.center)
            marker.title = parking.name
            marker.map = mainView.mapView
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parkingViewModel.parkings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = parkingViewModel.parkings[indexPath.row].name
        cell.detailTextLabel?.text = parkingViewModel.parkings[indexPath.row].description
        cell.imageView?.image = UIImage(named: "parking")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainView.mapView.camera = GMSCameraPosition.camera(withTarget: parkingViewModel.parkings[indexPath.row].center,
                                                                      zoom: 16.0)
    }
}
