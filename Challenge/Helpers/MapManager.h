//
//  MapManager.h
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

// MARK: - Map Bounds, In an real app, those bounds changes with the user movement
static CGFloat const kNorthernmost = 53.694865;
static CGFloat const kSouthernmost = 53.394655;
static CGFloat const kWestermost = 9.757589;
static CGFloat const kEasternmost = 10.099891;

@interface MapManager : NSObject

/// TODO: Include variables to return center, latitudinalMeters or longitudinalMeters given an especific coordinates
+ (CLLocationCoordinate2D) centerInBounds;
+ (CLLocationDistance) latitudinalMeters;
+ (CLLocationDistance) longitudinalMeters;

@end
