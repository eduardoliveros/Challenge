//
//  Services.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation
import AFNetworking

protocol ServiceResponse {
    
    func didCompleteRequestWithResponse(_ response: Any?, request: Int)
    
    func didCompleteRequestWithError(_ error: Error, request: Int)
}

class Services: NSObject {
    
    internal static let shared = Services()
    var manager = AFHTTPSessionManager()
    public var delegate: ServiceResponse?
    
    // MARK: - Method to call the request to get all Vehicles
    // TODO: This method should include variable coordinates to update the bounds with an user movement
    func getVehiclesWithBound(_ bound: Bound) {
        
        let urlAndParameters = GlobalVariables.URLS.getVehicles + "?p2Lat=" + "\(bound.southernmostCoordinate.latitude)" + "&p1Lon=" + "\(bound.northernmosCoordinate.longitude)" + "&p1Lat=" + "\(bound.northernmosCoordinate.latitude)" + "&p2Lon=" + "\(bound.southernmostCoordinate.longitude)"
        
        manager.get(urlAndParameters,
                    parameters: [],
                    progress: { _ in },
                    success: { _, operation in
                        self.delegate?.didCompleteRequestWithResponse(operation, request: GlobalVariables.RequestNumbers.getVehicles)
        },
                    failure: { _, error in
                        /// TODO: Include banner notification
                        print(error)
        }
        )
    }
}
