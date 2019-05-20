//
//  ParkingListView.swift
//  ParkingApp
//
//  Created by Sasha on 5/13/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import GoogleMaps

class ParkingListView: UIView {

    // MARK: - Properties

    let mapView: GMSMapView
    let tableView: UITableView

    // MARK: - Initalization

    override init(frame: CGRect) {
        // Create the map
        let camera = GMSCameraPosition.camera(withLatitude: 50.452342, longitude: 30.520033, zoom: 15.0)
        let map = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView = map
        tableView = UITableView()

        // Initilize super class
        super.init(frame: frame)

        self.setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        // Setup View Color
        self.backgroundColor = .white

        // Setup MapView
        self.mapView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(mapView)

        self.mapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.mapView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.mapView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.mapView.heightAnchor.constraint(equalToConstant: self.frame.height * 0.7).isActive = true

        // Setup TableView
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)

        self.tableView.topAnchor.constraint(equalTo: self.mapView.bottomAnchor).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
