//
//  WeatherService.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 4/13/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import "WeatherService.h"

#import <AFNetworking/AFNetworking.h>

@implementation WeatherService

- (void)searchByCity:(NSString *)city  withSuccess:(void (^)(NSDictionary *))success {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.wunderground.com/api/YOUR_API_KEY_HERE/conditions/q/CA/San_Francisco.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

@end
