//
//  WeatherResultsViewController.m
//  SunnyDaze
//
//  Created by Christopher Trevarthen on 4/20/15.
//  Copyright (c) 2015 Detroit Labs. All rights reserved.
//

#import "WeatherResultsViewController.h"

@interface WeatherResultsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionsLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end

@implementation WeatherResultsViewController

- (void)viewDidLoad {
    
    self.cityLabel.text = self.weather[@"current_observation"][@"display_location"][@"full"];
    self.temperatureLabel.text = [NSString stringWithFormat:@"%@F", self.weather[@"current_observation"][@"temp_f"] ];
    self.conditionsLabel.text = self.weather[@"current_observation"][@"weather"];
}

@end
