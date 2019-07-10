//
//  CustomPointAnnotation.h
//  Challenge
//
//  Created by Eduardo Oliveros Acosta on 7/10/19.
//  Copyright © 2019 Eduardo Oliveros Acosta. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface CustomPointAnnotation : MKPointAnnotation

@property(weak, nonatomic) NSString *imageName;
@property(nonatomic) int index;

@end
