//
//  SegmentControl.m
//  SegmentTest
//
//  Created by Enix Yu on 26/1/16.
//  Copyright © 2016 RobotBros. All rights reserved.
//

#import "SegmentControl.h"

@interface SegmentControl()

@property (nonatomic, readwrite) NSArray *viewControllers;
@property (nonatomic, readwrite) UINavigationController *navigationController;

@end

@implementation SegmentControl

@synthesize viewControllers, navigationController;

- (instancetype) initWithNavigationController:(UINavigationController *)aNavigationController
                              viewControllers:(NSArray *)theViewControllers{
    self = [super init];
    if(self){
        self.viewControllers = theViewControllers;
        self.navigationController = aNavigationController;
    }
    return self;
}

- (void)segmentedControlIndexDidChanged:(UISegmentedControl *)segmentedControl{
    // Get current index
    NSInteger segmentIndex = segmentedControl.selectedSegmentIndex;
    // Find out the view controller corresponding to the index
    UIViewController *incomingViewController = [self.viewControllers objectAtIndex:segmentIndex];
    // Set the new controllers as the navi view controllers
    NSArray<UIViewController*> *theControllers = [NSArray arrayWithObject:incomingViewController];
    [self.navigationController setViewControllers:theControllers animated:NO];
    // Replace the segmented control to the incoming view
    incomingViewController.navigationItem.titleView = segmentedControl;
    //UIView *segment = [incomingViewController.view viewWithTag:1];
    //[segment addSubview:segmentedControl];
}

@end
