//
//  FileUttilities.swift
//  ChallengeTests
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

import Foundation

class FileUttilities {
    
    static func loadJSON(_ file: String) -> Dictionary <String, AnyObject>? {
        guard let path = Bundle(for: self).path(forResource: file, ofType: "json"),
        let data = try? Data(contentsOf: NSURL(fileURLWithPath: path
        ) as URL, options: .mappedIfSafe),
        let serializedJSON = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary
            <String, AnyObject> else {
                
                return nil
        }
        return serializedJSON
    }
}
