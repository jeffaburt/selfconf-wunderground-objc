//
//  WeatherServiceSpec.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 5/29/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "WeatherService.h"

@interface WeatherService (Spec)

- (NSString *)weatherUrlStringFromCity:(NSString *)city andState:(NSString *)stateAbbreviation;

@end

SPEC_BEGIN(WeatherServiceSpec)

    describe(@"WeatherService", ^{
		
        let(weatherService, ^WeatherService *{
            return [WeatherService new];
        });
        
        describe(@"#weatherUrlStringFromCity:andState:", ^{
            
            context(@"it returns a URL string with the city and state", ^{
               
                NSBundle *mainBundleMock = [NSBundle nullMock];
                [NSBundle stub:@selector(mainBundle) andReturn:mainBundleMock];
                [mainBundleMock stub:@selector(objectForInfoDictionaryKey:) andReturn:@"12345" withArguments:@"weatherUndergroundAPIKey"];
                
                NSString *actualURLString = [weatherService weatherUrlStringFromCity:@"San Francisco" andState:@"CA"];
                
                [[actualURLString should] equal:@"http://api.wunderground.com/api/12345/conditions/q/CA/San_Francisco.json"];
                
                
                
            });
            
        });
        
    });
	
SPEC_END
