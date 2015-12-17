//
//  NavController.m
//  LovePets
//
//  Created by chenshaohai on 15/10/30.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "NavController.h"

@interface NavController ()
{
    BOOL isOrientationPortrait;
}
@end

@implementation NavController{
    UIDeviceOrientation lastAccepted;
    UIDeviceOrientation lastKnown;
}
-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self =[super initWithRootViewController:rootViewController]) {
        
    }
    return self;
    
}
-(void)setLockedToPortait:(BOOL)isLocked {
    isOrientationPortrait = isLocked;
}

-(UIDeviceOrientation) getCurrentOrientation {
    UIDeviceOrientation orientate = [[UIDevice currentDevice] orientation];
    if(orientate == 0) { // needed for simulator
        orientate = (UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation;
    }
    return orientate;
}

// Deprecated in iOS6, still needed for iOS5 support.
- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)toInterfaceOrientation
{
    UIDeviceOrientation orientation = [self getCurrentOrientation];
    [self setLastKnownOrientation:orientation];
    
    if(isOrientationPortrait == YES) {
        if([self isLastKnownPortrait] == YES) {
            [self setLastAcceptedOrientation:orientation];
            return YES;
        } else {
            return NO;
        }
    } else {
        if([self isLastKnownLandscape] == YES) {
            [self setLastAcceptedOrientation:orientation];
            return YES;
        } else {
            return NO;
        }
    }
}

// iOS6/7 support
- (BOOL)shouldAutorotate
{
    // find out the current device orientation
    UIDeviceOrientation orientation = [self getCurrentOrientation];
    [self setLastKnownOrientation:orientation];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if(isOrientationPortrait == YES) {
        if([self isLastKnownPortrait] == YES)
        {
            UIDeviceOrientation orientation = [self getCurrentOrientation];
            [self setLastAcceptedOrientation:orientation];
        }
        return (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown);
    } else {
        if([self isLastKnownLandscape] == YES)
        {
            UIDeviceOrientation orientation = [self getCurrentOrientation];
            [self setLastAcceptedOrientation:orientation];
        }
        return (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight );
    }
}
-(void)setLastAcceptedOrientation:(UIDeviceOrientation)orient  {
    lastAccepted = orient;
}

-(void)setLastKnownOrientation:(UIDeviceOrientation)orient {
    lastKnown = orient;
}

-(BOOL)isLastKnownPortrait {
    return UIDeviceOrientationIsPortrait(lastKnown);
}

-(BOOL)isLastKnownLandscape {
    return UIDeviceOrientationIsLandscape(lastKnown);
}

-(BOOL)isLastAcceptedPortrait {
    return UIDeviceOrientationIsPortrait(lastAccepted);
}

-(BOOL)isLastAcceptedLandscape {
    return UIDeviceOrientationIsLandscape(lastAccepted);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
