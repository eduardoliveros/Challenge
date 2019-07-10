//
//  MapManager.m
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

#import "MapManager.h"

@implementation MapManager

+ (CLLocationCoordinate2D) center {
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake((kNorthernmost + kSouthernmost) / 2, (kEasternmost + kWestermost) / 2);
    return center;
}

+ (CLLocationDistance) latitudinalMeters {
    CLLocation *northernmosLatitude = [[CLLocation alloc] initWithLatitude: 0.0 longitude: kWestermost];
    CLLocation *southernmostLatitude = [[CLLocation alloc] initWithLatitude: 0.0 longitude: kEasternmost];
    return [southernmostLatitude distanceFromLocation: northernmosLatitude];
}

+ (CLLocationDistance) longitudinalMeters {
    CLLocation *northernmosLatitude = [[CLLocation alloc] initWithLatitude: kNorthernmost longitude: 0.0];
    CLLocation *southernmostLatitude = [[CLLocation alloc] initWithLatitude: kSouthernmost longitude: 0.0];
    return [southernmostLatitude distanceFromLocation: northernmosLatitude];
}

@end
