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
static double const kNorthernmost = 53.694865;
static double const kSouthernmost = 53.394655;
static double const kWestermost = 9.757589;
static double const kEasternmost = 10.099891;

@interface MapManager : NSObject

/// TODO: Include variables to return center
+ (CLLocationCoordinate2D) centerInBound;
+ (CLLocationDistance) latitudinalMeters: (double) westermostLat easternmostLat: (double)easternmostLat;
+ (CLLocationDistance) longitudinalMeters: (double) northernmosLng southernmostLng: (double)southernmostLng;

@end
