//
//  ABFViewController.h
//  ABFAccuracyTestApp
//
//  Created by Yoshikazu.Nakase on 2014/07/04.
//  Copyright (c) 2014年 ACCESS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABFBeacon.h"
#import "BeaconDetectionView.h"

#define BEACON_UUID_DEFAULT    @"E02CC25E-0049-4185-832C-3A65DB755D01"
#define BEACON_UUID_IDENTIFIER @"ACCESS"

@interface ABFViewController : UIViewController <ABFBeaconDelegate>

@end
