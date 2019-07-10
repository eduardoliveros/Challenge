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
    
    func getVehicles() {
        let urlAndParameters = GlobalVariables.URLS.getVehicles+"?p2Lat=" + "\(kSouthernmost)" + "&p1Lon=" + "\(kWestermost)" + "&p1Lat=" + "\(kNorthernmost)" + "&p2Lon=" + "\(kEasternmost)"
        manager.get(urlAndParameters,
                    parameters: [],
                    progress: { _ in },
                    success: { _, operation in
                        self.delegate?.didCompleteRequestWithResponse(operation, request: GlobalVariables.RequestNumbers.getVehicles)
        },
                    failure: { _, error in
                        print(error)
        }
        )
    }
}
