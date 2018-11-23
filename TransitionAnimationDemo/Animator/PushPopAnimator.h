//
//  PushPopAnimator.h
//  groupKeychain
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//  导航控制器 push/pop 转场效果

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PushPopAnimator : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerInteractiveTransitioning>

@property (assign, nonatomic) UINavigationControllerOperation operation;

@end

NS_ASSUME_NONNULL_END
