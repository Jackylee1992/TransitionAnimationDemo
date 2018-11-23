//
//  ViewControllerC.m
//  groupKeychain
//
//  Created by Jacky on 2018/11/23.
//  Copyright © 2018 Xiangyang. All rights reserved.
//

#import "ViewControllerC.h"
#import "PresentDismissAnimator.h"

@interface ViewControllerC () <UIViewControllerTransitioningDelegate>

@end

@implementation ViewControllerC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.transitioningDelegate = self;
}

- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [PresentDismissAnimator new];
}


@end
