//
//  ChallengeTests.swift
//  ChallengeTests
//
//  Created by Eduardo Oliveros Acosta on 7/9/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import XCTest
@testable import Challenge

class MapManagerTests: XCTestCase {

    let defaultLatitudinalMeters = 38104.88433751914
    let defaultLongitudinalMeters = 33412.32197937021
    let defaultCenterLatitude = 53.54476
    let defaultCenterLongitude = 9.92874
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_MapManager_latitudinalMeters_defaultLatitudinalMeters() {
        // Given
        let latitudinalMeters = MapManager.latitudinalMeters(kWestermost, easternmostLat: kEasternmost)
        
        // Then
        XCTAssertEqual(latitudinalMeters, defaultLatitudinalMeters, "latitudinalMeters should be \(defaultLatitudinalMeters)")
    }
    
    func test_MapManager_longitudinalMeters_defaultLongitudinalMeters() {
        // Given
        let longitudinalMeters = MapManager.longitudinalMeters(kNorthernmost, southernmostLng: kSouthernmost)
        
        // Then
        XCTAssertEqual(longitudinalMeters, defaultLongitudinalMeters, "longitudinalMeters should be \(defaultLongitudinalMeters)")
    }
    
    func test_MapManager_CenterInBounds_CompareLatitudeAndLongitude() {
        // Given
        let center = MapManager.centerInBound()
        
        // Then
        XCTAssertEqual(center.latitude, defaultCenterLatitude, "center latitude should be \(defaultCenterLatitude)")
        XCTAssertEqual(center.longitude, defaultCenterLongitude, "center longitude should be \(defaultCenterLongitude)")
    }
}
