//
//  TabBarControllerAnimator.h
//  TransitionAnimationDemo
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//  TabBar 控制器切换视图转场效果

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TabBarControllerAnimationDirection) {
    TabBarControllerAnimationDirectionLeft,
    TabBarControllerAnimationDirectionRight,
};

NS_ASSUME_NONNULL_BEGIN

@interface TabBarControllerAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 * 从哪个方向切换过来
 */
@property (assign, nonatomic) TabBarControllerAnimationDirection direction;

@end

NS_ASSUME_NONNULL_END
