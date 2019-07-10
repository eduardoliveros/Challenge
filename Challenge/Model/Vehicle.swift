//
//  Vehicle.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation

// MARK: - Vehicle
struct Vehicle: Codable {
    let id: Int
    let coordinate: VehicleCoordinate
    let state, type: String
    let heading: Double
}
