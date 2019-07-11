
//
//  Mapper.swift
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation

class Mapper {
    // MARK: - Method to decode Json data to return a vehicle array
    static func decodeWithDataArray(_ array: [Any]) -> [Vehicle] {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        do {
            let dataNew = try Data(JSONSerialization.data(withJSONObject: array, options: .sortedKeys))
            guard let list: [Vehicle] = try? decoder.decode([Vehicle].self, from: dataNew) else {
                return []
            }
            return list
        } catch {
            /// TODO: Include banner notification
            print(error)
        }
        return []
    }
}
