//
//  ADBeaconDetectionView.m
//  ABFDetectionApp
//
//  Created by Yoshikazu.Nakase on 2014/06/19.
//  Copyright (c) 2014年 ACCESS. All rights reserved.
//

#import "BeaconDetectionView.h"

@implementation BeaconDetectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.beacon1Accuracy = 0;
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIFont *font = [UIFont fontWithName:@"Helvetica"size:14.0];
    NSDictionary *fontAttr = @{ NSFontAttributeName: font,
                                NSForegroundColorAttributeName:[UIColor blackColor] };

    float beaconX;
    float beaconY;
    float r;

    //Beacon1 (三角形の上の頂点)の描画
    r = 4.0;
    beaconX = self.bounds.size.width / 2;    //X方向画面中央
    beaconY = 100;                           //Y方向100pt
    CGRect beaconRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextFillEllipseInRect(context, beaconRect);  //
    NSString *accuStr = [NSString stringWithFormat:@"%2.2f m", self.beacon1Accuracy];
    [accuStr drawAtPoint:CGPointMake(beaconX - r, beaconY + 4) withAttributes:fontAttr]; //距離の文字を描画

    //Beacon1のAccuracyの円の描画
    r = self.beacon1Accuracy * 100.0;
    CGRect waveRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 0.3);
    CGContextSetLineWidth(context, 2.0);
    CGContextFillEllipseInRect(context, waveRect);

    //Beacon2 (三角形の左下の頂点)の描画
    r = 4.0;
    beaconX = (self.bounds.size.width / 2) - 150;
    beaconY = 100 + (0.866 * 300);
    beaconRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextFillEllipseInRect(context, beaconRect);
    accuStr = [NSString stringWithFormat:@"%2.2f m", self.beacon2Accuracy];
    [accuStr drawAtPoint:CGPointMake(beaconX - r, beaconY + 4) withAttributes:fontAttr];

    //Beacon2のAccuracyの円の描画
    r = self.beacon2Accuracy * 100.0;
    waveRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, 0.3);
    CGContextSetLineWidth(context, 2.0);
    CGContextFillEllipseInRect(context, waveRect);

    //Beacon3 (三角形の右下の頂点)の描画
    r = 4.0;
    beaconX = (self.bounds.size.width / 2) + 150;
    beaconY = 100 + (0.866 * 300);
    beaconRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
    CGContextFillEllipseInRect(context, beaconRect);
    accuStr = [NSString stringWithFormat:@"%2.2f m", self.beacon3Accuracy];
    [accuStr drawAtPoint:CGPointMake(beaconX - 40, beaconY + 8) withAttributes:fontAttr];

    //Beacon3のAccuracyの円の描画
    r = self.beacon3Accuracy * 100.0;
    waveRect = CGRectMake(beaconX - r, beaconY - r, r * 2, r * 2);
    CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 0.3);
    CGContextSetLineWidth(context, 2.0);
    CGContextFillEllipseInRect(context, waveRect);
}

@end
