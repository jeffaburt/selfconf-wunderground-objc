//
//  LocationEntryViewControllerSpec.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 5/29/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LocationEntryViewController.h"

@interface LocationEntryViewController (Spec)

@property (strong, nonatomic) IBOutlet UITextField *searchCity;
@property (strong, nonatomic) NSString *selectedState;

- (BOOL)isInputValid;

@end

SPEC_BEGIN(LocationEntryViewControllerSpec)

    describe(@"LocationEntryViewController", ^{
        
        let(vc, ^LocationEntryViewController *{
            return [LocationEntryViewController new];
        });
        
        describe(@"#isInputValid", ^{
           
            context(@"when city and state are filled in", ^{
               
                beforeEach(^{
                   
                    [vc stub:@selector(selectedState) andReturn:@"MI"];
                    [vc stub:@selector(searchCity) andReturn:[UITextField nullMock]];
                    [vc.searchCity stub:@selector(text) andReturn:@"Detroit"];
                    
                });
                
                it(@"returns YES", ^{
                   
                    [[theValue([vc isInputValid]) should] equal:theValue(YES)];
                    
                });
                
            });
            
            context(@"when city is not in filled in", ^{
                
                beforeEach(^{
                    
                    [vc stub:@selector(selectedState) andReturn:@"MI"];
                    [vc stub:@selector(searchCity) andReturn:[UITextField nullMock]];
                    [vc.searchCity stub:@selector(text) andReturn:nil];
                    
                });
                
                it(@"returns NO", ^{
                    
                    [[theValue([vc isInputValid]) should] equal:theValue(NO)];
                    
                });
                
            });
            
            context(@"when state is not in filled in", ^{
                
                beforeEach(^{
                    
                    [vc stub:@selector(selectedState) andReturn:nil];
                    [vc stub:@selector(searchCity) andReturn:[UITextField nullMock]];
                    [vc.searchCity stub:@selector(text) andReturn:@"Detroit"];
                    
                });
                
                it(@"returns NO", ^{
                    
                    [[theValue([vc isInputValid]) should] equal:theValue(NO)];
                    
                });
                
            });
            
        });
        
    });
	
SPEC_END
