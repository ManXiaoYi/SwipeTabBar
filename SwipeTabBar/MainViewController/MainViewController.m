//
//  MainViewController.m
//  Demo
//
//  Created by 满孝意 on 15/12/24.
//  Copyright © 2015年 满孝意. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISwipeGestureRecognizer *swipeGRLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeGRLeft setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [self.view addGestureRecognizer:swipeGRLeft];
    
    UISwipeGestureRecognizer *swipeGRRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    [swipeGRRight setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [self.view addGestureRecognizer:swipeGRRight];
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
    NSUInteger currentIndex = self.tabBarController.selectedIndex;
    
    CATransition *transaction = [CATransition animation];
    transaction.type = kCATransitionPush;
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        [transaction setSubtype:kCATransitionFromRight];
        self.tabBarController.selectedIndex = MIN(self.childViewControllers.count - 1, currentIndex + 1);
    } else {
        [transaction setSubtype:kCATransitionFromLeft];
        self.tabBarController.selectedIndex = MAX(0, currentIndex - 1);
    }
    
    if (currentIndex == self.tabBarController.selectedIndex) {
        return;
    }
    
    transaction.duration = 5;
    transaction.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    [[self.view layer] addAnimation:transaction forKey:@"switchView"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
