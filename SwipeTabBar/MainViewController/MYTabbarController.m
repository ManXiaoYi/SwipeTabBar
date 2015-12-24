//
//  MYTabbarController.m
//  Demo
//
//  Created by 满孝意 on 15/12/23.
//  Copyright © 2015年 满孝意. All rights reserved.
//

#import "MYTabbarController.h"

@interface MYTabbarController () <UITabBarControllerDelegate>

@end

@implementation MYTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setup];
}

- (void)setup {
    [self addCenterButtonWithImage:[UIImage imageNamed:@"3_1"] selectedImage:[UIImage imageNamed:@"3_1"]];
    self.delegate = self;
    self.selectedIndex = 2;
    self.oddButton.selected = NO;
}

#pragma mark -
#pragma mark - addCenterButton
- (void)addCenterButtonWithImage:(UIImage*)buttonImage selectedImage:(UIImage*)selectedImage {
    self.oddButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.oddButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    self.oddButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    
    //  设定button大小为适应图片
    self.oddButton.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [self.oddButton setImage:buttonImage forState:UIControlStateNormal];
    [self.oddButton setImage:selectedImage forState:UIControlStateSelected];
    
    // 去掉选中button时候的阴影
    self.oddButton.adjustsImageWhenHighlighted = NO;
    
    /*
     *  核心代码：设置button的center 和 tabBar的 center 做对齐操作， 同时做出相对的上浮
     */
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0) {
        self.oddButton.center = self.tabBar.center;
    } else {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        self.oddButton.center = center;
    }
    
    [self.view addSubview:self.oddButton];
}

- (void)pressChange:(id)sender {
    self.selectedIndex = 2;
    self.oddButton.selected = YES;
    self.oddButton.userInteractionEnabled = NO;
}

#pragma mark -
#pragma mark - UITabBarControllerDelegate
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (self.selectedIndex == 2) {
        self.oddButton.selected = YES;
    } else {
        self.oddButton.selected = NO;
        self.oddButton.userInteractionEnabled = YES;
    }
}

@end
