//
//  MapManager.m
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

#import "MapManager.h"

@implementation MapManager

// MARK: - Return center In a Bound
+ (CLLocationCoordinate2D) centerInBound {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((kNorthernmost + kSouthernmost) / 2, (kEasternmost + kWestermost) / 2);
    return center;
}

// MARK: - Return latitudinal distance in Meters
+ (CLLocationDistance) latitudinalMeters: (double) westermostLat easternmostLat: (double)easternmostLat {
    CLLocation *westermostLatitude = [[CLLocation alloc] initWithLatitude: 0.0 longitude: westermostLat];
    CLLocation *easternmostLatitude = [[CLLocation alloc] initWithLatitude: 0.0 longitude: easternmostLat];
    return [easternmostLatitude distanceFromLocation: westermostLatitude];
}

// MARK: - Return longitudinalMeters distance in Meters
+ (CLLocationDistance) longitudinalMeters: (double) northernmosLng southernmostLng: (double)southernmostLng {
    CLLocation *northernmosLatitude = [[CLLocation alloc] initWithLatitude: northernmosLng longitude: 0.0];
    CLLocation *southernmostLatitude = [[CLLocation alloc] initWithLatitude: southernmostLng longitude: 0.0];
    return [southernmostLatitude distanceFromLocation: northernmosLatitude];
}

@end
