//
//  ViewControllerA.m
//  groupKeychain
//
//  Created by Jacky on 2018/11/22.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "ViewControllerA.h"
#import "PushPopAnimator.h"

@interface ViewControllerA () <UINavigationControllerDelegate>

@end

@implementation ViewControllerA

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    NSLog(@"%zd", operation);
    PushPopAnimator *animator = [[PushPopAnimator alloc] init];
    animator.operation = operation;
    return animator;
}

//- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
//                         interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
//    return [[PushPopAnimator alloc] init];
//}

@end
