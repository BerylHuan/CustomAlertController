//
//  KTDownUpAnimationController.m
//  KTAlertController
//
//  Created by 上海易裁 on 16/8/18.
//  Copyright © 2016年 Kevin. All rights reserved.
//

#import "KTDownUpAnimationController.h"
#import "KTAlertController.h"

@implementation KTDownUpAnimationController

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    // 1
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (toVC.isBeingPresented) {
        return 0.3;
    }
    else if (fromVC.isBeingDismissed) {
        return 0.1;
    }
    
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    KTAlertController *toVC = (KTAlertController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    if (!toVC || !fromVC) {
        return;
    }
    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    if (toVC.isBeingPresented) {
        // 2
        [containerView addSubview:toVC.view];
        toVC.view.frame = CGRectMake(0.0, 0.0, containerView.frame.size.width, containerView.frame.size.height);
        toVC.backView.alpha = 0.0;
        toVC.contentView.center = CGPointMake(containerView.center.x, containerView.frame.size.height);
        [UIView animateWithDuration:duration animations:^{
            toVC.backView.alpha = 0.3;
            toVC.contentView.center = containerView.center;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    else if (fromVC.isBeingDismissed) {
        // 3
        [UIView animateWithDuration:duration animations:^{
            fromVC.view.alpha = 0.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
}
@end