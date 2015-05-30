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

- (void)searchByCity:(NSString *)city andState:(NSString *)stateAbbreviation withSuccess:(void (^)(NSDictionary *))success {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *weatherUrlString = [self weatherUrlStringFromCity:city andState:stateAbbreviation];
    
    [manager GET:weatherUrlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (NSString *)weatherUrlStringFromCity:(NSString *)city andState:(NSString *)stateAbbreviation {
 
    NSString *cityParam = [city stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    NSString *searchParams = [NSString stringWithFormat:@"q/%@/%@.json", stateAbbreviation, cityParam];
    
    // Add the weatherUndergroundAPIKey to your target's Info.plist
    NSString *apiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"weatherUndergroundAPIKey"];
    
    NSString *weatherUrlString = [NSString stringWithFormat:@"http://api.wunderground.com/api/%@/conditions/%@", apiKey, searchParams];

    return weatherUrlString;
    
}

@end
