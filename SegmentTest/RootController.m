//
//  RootController.m
//  SegmentTest
//
//  Created by Enix Yu on 27/1/16.
//  Copyright © 2016 RobotBros. All rights reserved.
//

#import "RootController.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface RootController ()

@property (copy, nonatomic) NSArray *myViewControllers;

@end


@implementation RootController

#pragma mark -
#pragma Initialize stuff

- (instancetype) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        self.myViewControllers = [self segmentViewControllers];
        [self firstExperience];
    }
    return self;
}

- (void)firstExperience{
    [self setCurrentViewControllers:0];
}

- (NSArray<UIViewController *> *) segmentViewControllers{
    UIStoryboard *storyBaord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *viewController1 = [storyBaord instantiateViewControllerWithIdentifier:@"helloview"];
    ViewController2 *viewController2 = [storyBaord instantiateViewControllerWithIdentifier:@"worldview"];
    NSArray<UIViewController *> *arrayOfControllers = [NSArray arrayWithObjects:viewController1, viewController2, nil];
    return arrayOfControllers;
}


#pragma mark -
#pragma Responding methods for segmented control index changed

- (void)segmentedControlIndexDidChanged:(UISegmentedControl *)segmentedControl{
    // Get current index
    NSInteger segmentIndex = segmentedControl.selectedSegmentIndex;
    [self setCurrentViewControllers:segmentIndex];
}

- (void) setCurrentViewControllers:(NSInteger)aIndex{
    // Find out the view controller corresponding to the index
    UIViewController *incomingViewController = [self.myViewControllers objectAtIndex:aIndex];
    // Set the new controllers as the navi view controllers
    NSArray<UIViewController*> *theControllers = [NSArray arrayWithObject:incomingViewController];
    [self setViewControllers:theControllers animated:NO];
    
    // Register event handler for segmented control value change
    UISegmentedControl *segmentSwitch = [incomingViewController.view viewWithTag:1];
    [segmentSwitch setSelectedSegmentIndex:aIndex];
    [segmentSwitch addTarget:self action:@selector(segmentedControlIndexDidChanged:) forControlEvents:UIControlEventValueChanged];
}


@end
