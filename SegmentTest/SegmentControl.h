//
//  SegmentControl.h
//  SegmentTest
//
//  Created by Enix Yu on 26/1/16.
//  Copyright © 2016 RobotBros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SegmentControl : NSObject

@property (nonatomic, readonly) NSArray *viewControllers;
@property (nonatomic, readonly) UINavigationController *navigationController;


- (instancetype) initWithNavigationController:(UINavigationController *)aNavigationController
                              viewControllers:(NSArray *)theViewControllers;

- (void)segmentedControlIndexDidChanged:(UISegmentedControl *)segmentedControl;

@end
