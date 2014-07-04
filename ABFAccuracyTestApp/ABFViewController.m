//
//  ABFViewController.m
//  ABFAccuracyTestApp
//
//  Created by Yoshikazu.Nakase on 2014/07/04.
//  Copyright (c) 2014年 ACCESS. All rights reserved.
//

#import "ABFViewController.h"

@interface ABFViewController ()
@property (strong, nonatomic) IBOutlet BeaconDetectionView *detectView;
@property (nonatomic) ABFBeacon *abfBeacon;

@end

@implementation ABFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.abfBeacon = [ABFBeacon sharedManager];
    self.abfBeacon.delegate = self;
    ABFBeaconRegion *region = [self.abfBeacon registerRegion:BEACON_UUID_DEFAULT identifier:BEACON_UUID_IDENTIFIER];
    if (region) {
        region.rangingEnabled = YES;
    }
    [self.abfBeacon startMonitoring];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//////////
- (void)didRangeBeacons:(ABFBeaconRegion *)region
{
    NSLog(@"didRangeBeacons: region=%@", region);
    
    for (CLBeacon *beacon in region.beacons) {
        NSLog(@"major:%@, minor:%@, accu:%f", beacon.major, beacon.minor, beacon.accuracy);
        
        if ([beacon.minor isEqualToNumber:[NSNumber numberWithInt:570]]) {
            if (beacon.accuracy > 0) {
                self.detectView.beacon1Accuracy = beacon.accuracy;
            }
        } else if ([beacon.minor isEqualToNumber:[NSNumber numberWithInt:566]]) {
            if (beacon.accuracy > 0) {
                self.detectView.beacon2Accuracy = beacon.accuracy;
            }
        } else if ([beacon.minor isEqualToNumber:[NSNumber numberWithInt:565]]) {
            if (beacon.accuracy > 0) {
                self.detectView.beacon3Accuracy = beacon.accuracy;
            }
        }
        [self.detectView setNeedsDisplay];
    }
}

@end
