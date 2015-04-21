//
//  WeatherService.h
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 4/13/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherService : NSObject

- (NSDictionary *)searchByCity:(NSString *)city;

@end
