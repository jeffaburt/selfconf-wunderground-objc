//
//  WeatherService.h
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 4/13/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherService : NSObject

- (void)searchByCity:(NSString *)city andState:(NSString *)stateAbbreviation withSuccess:(void (^)(NSDictionary *))successBlock andFailure:(void (^)(NSError *))errorBlock;

@end
