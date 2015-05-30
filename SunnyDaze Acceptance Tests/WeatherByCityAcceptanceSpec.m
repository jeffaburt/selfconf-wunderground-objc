//
//  WeatherByCityAcceptanceSpec.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 5/30/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import <KIF-Kiwi.h>

@implementation KIFUITestActor (Regex)

- (UIView *)waitForViewWithAccessibilityLabelMatchingPattern:(NSString *)pattern {
    UIView *view = nil;
    [self waitForAccessibilityElement:NULL view:&view withElementMatchingPredicate:[NSPredicate predicateWithFormat:@"accessibilityLabel MATCHES %@", pattern] tappable:NO];
    return view;
}

@end

SPEC_BEGIN(WeatherByCityAcceptanceSpec)

    describe(@"WeatherByCityAcceptance", ^{
		
        describe(@"Location Entry", ^{
            
            context(@"when state is chosen from picker", ^{
                
                it(@"populates the state textfield", ^{
                    
                    [tester tapViewWithAccessibilityLabel:@"Select State"];
                    
                    [tester selectPickerViewRowWithTitle:@"Michigan"];
                    
                    [tester waitForViewWithAccessibilityLabel:@"Select State" value:@"Michigan" traits:UIAccessibilityTraitNone];
                    
                });
                
            });
            
        });
        
        describe(@"Location Search", ^{
            
            it(@"has a button for searching", ^{
                [tester waitForViewWithAccessibilityLabel:@"Location Search"];
                [tester waitForTappableViewWithAccessibilityLabel:@"Find Weather"];
            });
            
            context(@"when city and state are valid", ^{
                
                it(@"shows the weather results", ^{

                    [tester enterText:@"Detroit" intoViewWithAccessibilityLabel:@"Enter City"];
                    
                    [tester tapViewWithAccessibilityLabel:@"Select State"];
                    [tester selectPickerViewRowWithTitle:@"Michigan"];
                    
                    [tester tapViewWithAccessibilityLabel:@"Find Weather"];
                    
                    [tester waitForViewWithAccessibilityLabel:@"Weather"];
                    [tester waitForViewWithAccessibilityLabel:@"Detroit, MI"];
                    [tester waitForViewWithAccessibilityLabel:@"Temperature:"];
                    [tester waitForViewWithAccessibilityLabelMatchingPattern:@".*C\\)"];
                    [tester waitForViewWithAccessibilityLabel:@"Conditions:"];
                    
                });
                
            });
            
        });
        
    });
	
SPEC_END
