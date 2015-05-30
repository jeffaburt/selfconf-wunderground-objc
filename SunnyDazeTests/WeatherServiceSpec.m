//
//  WeatherServiceSpec.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 5/29/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <OHHTTPStubs/OHHTTPStubs.h>

#import "WeatherService.h"

@interface WeatherService (Spec)

- (NSString *)weatherUrlStringFromCity:(NSString *)city andState:(NSString *)stateAbbreviation;

@end

SPEC_BEGIN(WeatherServiceSpec)

    describe(@"WeatherService", ^{
		
        beforeEach(^{
            NSBundle *mainBundleMock = [NSBundle nullMock];
            [NSBundle stub:@selector(mainBundle) andReturn:mainBundleMock];
            [mainBundleMock stub:@selector(objectForInfoDictionaryKey:) andReturn:@"12345" withArguments:@"weatherUndergroundAPIKey"];
        });
        
        let(weatherService, ^WeatherService *{
            return [WeatherService new];
        });
        
        describe(@"#weatherUrlStringFromCity:andState:", ^{
            
            it(@"returns a URL string with the city and state", ^{
                
                NSString *actualURLString = [weatherService weatherUrlStringFromCity:@"San Francisco" andState:@"CA"];
                
                [[actualURLString should] equal:@"http://api.wunderground.com/api/12345/conditions/q/CA/San_Francisco.json"];
                
            });
            
        });
        
        context(@"when API call is successful", ^{
           
            beforeAll(^{
                
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    
                    return [request.URL.absoluteString isEqualToString:@"http://api.wunderground.com/api/12345/conditions/q/CA/San_Francisco.json"];
                    
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    
                    // Stub it with our "weather.json" stub file (which is in same bundle as self)
                    NSString* fixture = OHPathForFile(@"weather.json", self.class);
                    return [OHHTTPStubsResponse responseWithFileAtPath:fixture
                                                            statusCode:200 headers:@{@"Content-Type":@"application/json"}];
                    
                }];
                
            });
            
            it(@"calls the success block with weather dictionary", ^{
                
                __block NSDictionary *weatherResponse;
                
                NSString *city = @"San Francisco";
                NSString *stateAbbreviation = @"CA";
                
                [weatherService searchByCity:city andState:stateAbbreviation withSuccess:^(NSDictionary *weather) {
                
                    weatherResponse = weather;
                    
                }];
                
                [[expectFutureValue(weatherResponse[@"current_observation"][@"display_location"][@"full"]) shouldEventually] equal:@"San Francisco, CA"];
                
            });
            
            afterAll(^{
               
                [OHHTTPStubs removeAllStubs];
                
            });
            
        });
        
    });
	
SPEC_END
