//
//  MapManager.h
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

static CGFloat const kNorthernmost = 53.694865;
static CGFloat const kSouthernmost = 53.394655;
static CGFloat const kWestermost = 9.757589;
static CGFloat const kEasternmost = 10.099891;

@interface MapManager : NSObject

+ (CLLocationCoordinate2D) center;
+ (CLLocationDistance) latitudinalMeters;
+ (CLLocationDistance) longitudinalMeters;

@end
