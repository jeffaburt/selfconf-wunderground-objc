//
//  LocationEntryViewController.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 4/13/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import "LocationEntryViewController.h"

#import "WeatherResultsViewController.h"
#import "WeatherService.h"

@interface LocationEntryViewController ()

@property (strong, nonatomic) IBOutlet UITextField *searchInput;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@end

@implementation LocationEntryViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Weather"]) {
        WeatherResultsViewController *vc = segue.destinationViewController;
        vc.weather = sender;
    }
    
}

- (IBAction)didTapSearchButton:(id)sender {
    
    WeatherService *service = [WeatherService new];
    
    NSString *city = self.searchInput.text;
    
    NSDictionary *weather = [service searchByCity:city];
    
    [self performSegueWithIdentifier:@"Weather" sender:weather];
}


@end
