//
//  GlobalVariables.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

struct ViewIdentifier {
    // ViewContrroller
    static let principalTVC = "principalTVC"
    
    // TableViewCell
    static let principalCell = "principalCell"
}

class GlobalVariables: NSObject {
    struct RequestNumbers {
        static var getVehicles = 1 as Int
    }
    
    struct URLS {
        //PRINCIPAL
        
        static let dev = "https://poi-api.mytaxi.com/PoiService/poi/"
        static let prod = "https://poi-api.mytaxi.com/PoiService/poi/"
        
        static let URL = dev
        
        //Vehicles
        static let getVehicles = URL + "v1" as String
    }
}
