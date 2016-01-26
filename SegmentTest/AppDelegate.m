//
//  AppDelegate.m
//  SegmentTest
//
//  Created by Enix Yu on 26/1/16.
//  Copyright © 2016 RobotBros. All rights reserved.
//

#import "AppDelegate.h"
#import "SegmentControl.h"
#import "ViewController.h"
#import "ViewController2.h"

@interface AppDelegate ()

@property (nonatomic, strong) SegmentControl *segmentControl;
@property (nonatomic, strong) UISegmentedControl *uiSegmentedControl;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray<UIViewController *> *viewControllers = [self segmentViewControllers];
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    self.segmentControl = [[SegmentControl alloc] initWithNavigationController:navigationController
            viewControllers:viewControllers];
    self.uiSegmentedControl = [[UISegmentedControl alloc] initWithItems:[viewControllers valueForKey:@"title"]];
    [self.uiSegmentedControl addTarget:self.segmentControl action:@selector(segmentedControlIndexDidChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self firstExperience];
    
    //[self.window addSubview:navigationController.view];
    [self.window setRootViewController:navigationController];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (NSArray<UIViewController *> *) segmentViewControllers{
    UIStoryboard *storyBaord = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *view1 = [storyBaord instantiateViewControllerWithIdentifier:@"helloview"];
    ViewController2 *view2 = [storyBaord instantiateViewControllerWithIdentifier:@"worldview"];
    NSArray<UIViewController *> *arrayOfControllers = [NSArray arrayWithObjects:view1, view2, nil];
    return arrayOfControllers;
}

- (void) firstExperience{
    self.uiSegmentedControl.selectedSegmentIndex = 0;
    [self.segmentControl segmentedControlIndexDidChanged:self.uiSegmentedControl];
}

@end
