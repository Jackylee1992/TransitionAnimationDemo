//
//  TabBarControllerAnimator.m
//  TransitionAnimationDemo
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "TabBarControllerAnimator.h"

@implementation TabBarControllerAnimator

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    transitionContext.containerView.backgroundColor = [UIColor whiteColor];
    [transitionContext.containerView addSubview:toVC.view];
    
    toVC.view.alpha = 0;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger factor = 1;
    if (self.direction == TabBarControllerAnimationDirectionLeft) {
        factor = -1;
    }
    toVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, screenWidth * 0.5 * factor, 0);
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         toVC.view.alpha = 1;
                         fromVC.view.alpha = 0;
                         toVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, 0, 0);
                         fromVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, -screenWidth * 0.5 * factor, 0);
                     }
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
