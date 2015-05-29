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

@property (strong, nonatomic) IBOutlet UITextField *searchCity;
@property (strong, nonatomic) IBOutlet UIButton *searchButton;

@property (weak, nonatomic) IBOutlet UITextField *searchState;
@property (strong, nonatomic) IBOutlet UIPickerView *statePicker;
@property (strong, nonatomic) NSArray *stateAbbreviations;
@property (strong, nonatomic) NSArray *stateNames;
@property (strong, nonatomic) NSString *selectedState;

@end

@implementation LocationEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stateAbbreviations = @[@"", @"MI", @"CA"];
    self.stateNames = @[@"Select State", @"Michigan", @"California"];
    
    self.statePicker = [UIPickerView new];
    self.statePicker.delegate = self;
    self.statePicker.dataSource = self;
//    self.statePicker.showsSelectionIndicator = YES;
    self.searchState.inputView = self.statePicker;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Weather"]) {
        WeatherResultsViewController *vc = segue.destinationViewController;
        vc.weather = sender;
    }
    
}

- (IBAction)didTapSearchButton:(id)sender {
    
    WeatherService *service = [WeatherService new];
    
    NSString *city = self.searchCity.text;
    
    [service searchByCity:city andState:self.selectedState withSuccess:^(NSDictionary *weather) {
        [self performSegueWithIdentifier:@"Weather" sender:weather];
    }];

}

#pragma mark -- UIPickerView Delegate Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return ([self.stateAbbreviations count]);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return ([self.stateNames objectAtIndex:row]);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (row == 0) {
        self.searchState.text = @"";
        self.selectedState = nil;
    } else {
        self.searchState.text = [self.stateNames objectAtIndex:row];
        self.selectedState = ([self.stateAbbreviations objectAtIndex:row]);
    }
    
}

@end
