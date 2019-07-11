//
//  MapperTest.swift
//  ChallengeTests
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import XCTest
@testable import Challenge

class MapperTests: XCTestCase {
    var json = FileUttilities.loadJSON("MockVehiclesArray")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Mapper_DecodeWithDataArray_DataCountGreaterThanZero() {
        // Given
        guard let array = json?["poiList"] as? [Any] else {
            XCTFail("poiList should exist")
            return
        }
        let data = Mapper.decodeWithDataArray(array)
        XCTAssertGreaterThan(data.count, 0, "Vehicles Array should be greather than zero")
    }
}
