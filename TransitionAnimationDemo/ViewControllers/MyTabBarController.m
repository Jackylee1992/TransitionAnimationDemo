//
//  MyTabBarController.m
//  groupKeychain
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "MyTabBarController.h"
#import "TabBarControllerAnimator.h"

@interface MyTabBarController () <UITabBarControllerDelegate>

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.tabBar.translucent = NO;
    
    // 添加左右滑动手势，用于切换视图
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)swipe:(UISwipeGestureRecognizer *)gesture {
    if (gesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        // 向左滑动
        if (self.selectedIndex >= self.childViewControllers.count - 1) {
            return;
        }
        [self setSelectedIndex:++self.selectedIndex];
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        // 向右滑动
        if (self.selectedIndex <= 0) {
            return;
        }
        [self setSelectedIndex:--self.selectedIndex];
    }
}

#pragma mark - UITabBarControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC {
    TabBarControllerAnimator *animator = [TabBarControllerAnimator new];
    if ([self.childViewControllers indexOfObject:toVC] > [self.childViewControllers indexOfObject:fromVC]) {
        animator.direction = TabBarControllerAnimationDirectionRight;
    } else {
        animator.direction = TabBarControllerAnimationDirectionLeft;
    }
    return animator;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
