//
//  PresentDismissAnimator.m
//  groupKeychain
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "PresentDismissAnimator.h"

@implementation PresentDismissAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"dismiss 转场细节");
//    UIView *containerView = transitionContext.containerView;
//    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // insert 并非必要，但是如无 toVC.view 会发生跳动，和导航栏半透明有关
    [transitionContext.containerView insertSubview:toVC.view atIndex:0];
    transitionContext.containerView.backgroundColor = [UIColor whiteColor];
    
    [UIView transitionFromView:fromVC.view
                        toView:toVC.view
                      duration:[self transitionDuration:transitionContext]
                       options:(UIViewAnimationOptionTransitionCrossDissolve)
                    completion:^(BOOL finished) {
                        // 考虑到转场中途异常取消情况，回复原始状态
                        if (transitionContext.transitionWasCancelled) {
                            fromVC.view.transform = CGAffineTransformIdentity;
                            toVC.view.transform = CGAffineTransformIdentity;
                        }
                        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                    }];
    
}

@end
