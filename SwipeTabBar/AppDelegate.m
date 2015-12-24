//
//  AppDelegate.m
//  SwipeTabBar
//
//  Created by 满孝意 on 15/12/24.
//  Copyright © 2015年 满孝意. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "MYTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FirstViewController *vc1 = [[FirstViewController alloc] init];
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    ThirdViewController *vc3 = [[ThirdViewController alloc] init];
    FourthViewController *vc4 = [[FourthViewController alloc] init];
    FifthViewController *vc5 = [[FifthViewController alloc] init];
    
    NSArray *vcArray = [[NSArray alloc] initWithObjects:vc1, vc2, vc3, vc4, vc5, nil];
    NSArray *imageArray = [[NSArray alloc] initWithObjects:@"1_1", @"2_1", @"", @"4_1", @"5_1",  nil];
    NSArray *selectdImageArray = [[NSArray alloc] initWithObjects:@"1_2", @"2_2", @"", @"4_2", @"5_2",  nil];
    NSMutableArray *navArray = [[NSMutableArray alloc] init];
    for (int i=0; i<5; i++) {
        ((UIViewController *)vcArray[i]).tabBarItem.image = [[UIImage imageNamed:imageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ((UIViewController *)vcArray[i]).tabBarItem.selectedImage = [[UIImage imageNamed:selectdImageArray[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        ((UIViewController *)vcArray[i]).tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
        if (i == 1) {
            ((UIViewController *)vcArray[i]).tabBarItem.imageInsets = UIEdgeInsetsMake(6, -6, -6, 6);
        } else if (i == 3) {
            ((UIViewController *)vcArray[i]).tabBarItem.imageInsets = UIEdgeInsetsMake(6, 6, -6, -6);
        }
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:(UIViewController *)vcArray[i]];
        [navArray addObject:nav];
    }
    
    MYTabbarController *tabBC = [[MYTabbarController alloc] init];
    tabBC.viewControllers = navArray;
    self.window.rootViewController = tabBC;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
