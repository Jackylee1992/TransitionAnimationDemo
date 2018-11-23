//
//  PushPopAnimator.m
//  groupKeychain
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "PushPopAnimator.h"

@implementation PushPopAnimator


#pragma mark - UINavigationControllerDelegate
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    NSLog(@"实现转场细节");
//    [UIView transitionFromView:[transitionContext viewForKey:UITransitionContextFromViewKey]
//                        toView:[transitionContext viewForKey:UITransitionContextToViewKey]
//                      duration:[self transitionDuration:transitionContext]
//                       options:UIViewAnimationOptionTransitionNone
//                    completion:^(BOOL finished) {
//                        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//                    }];
//
//    return;
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    transitionContext.containerView.backgroundColor = [UIColor whiteColor];

    // 把 toVC 添加到转场视图
    [transitionContext.containerView addSubview:toVC.view];
    //    toVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, screenWidth, 0);
    
    
    if (self.operation == UINavigationControllerOperationPush) {
        toVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, screenWidth, screenHeight);
    } else {
        toVC.view.frame = CGRectOffset(transitionContext.containerView.bounds, -screenWidth, -screenHeight);
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         //                         fromVC.view.frame = CGRectOffset(fromVC.view.frame, -screenWidth, 0);
                         //                         toVC.view.frame = transitionContext.containerView.bounds;
                         if (self.operation == UINavigationControllerOperationPush) {
                             fromVC.view.frame = CGRectOffset(fromVC.view.frame, -screenWidth, -screenHeight);
                             toVC.view.frame = transitionContext.containerView.bounds;
                         } else {
                             fromVC.view.frame = CGRectOffset(fromVC.view.frame, screenWidth, screenHeight);
                             toVC.view.frame = transitionContext.containerView.bounds;
                         }
                     }
                     completion:^(BOOL finished) {
                         // 考虑到转场中途异常取消情况，回复原始状态
                         if (transitionContext.transitionWasCancelled) {
                             fromVC.view.transform = CGAffineTransformIdentity;
                             toVC.view.transform = CGAffineTransformIdentity;
                         }
                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
                     }];
    
    
    //    [UIView animateWithDuration:[self transitionDuration:transitionContext]
    //                          delay:0
    //         usingSpringWithDamping:10
    //          initialSpringVelocity:10
    //                        options:UIViewAnimationOptionCurveEaseInOut
    //                     animations:^{
    //                         fromVC.view.frame = CGRectOffset(fromVC.view.frame, 0, -screenHeight);
    //                         toVC.view.frame = transitionContext.containerView.bounds;
    //                     } completion:^(BOOL finished) {
    //                         [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    //                     }];
    
    NSLog(@"end");
}

- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
}

@end
