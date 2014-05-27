//
// Created by Dani Postigo on 5/25/14.
//

#import <DPKit-Utils/UIView+DPKitDebug.h>
#import "NavigationFadeAnimator.h"

@implementation NavigationFadeAnimator

- (void) presentWithContext: (id <UIViewControllerContextTransitioning>) context {
    [super presentWithContext: context];

    UIView *containerView = context.containerView;
    UIView *sourceView = [self fromViewController: context].view;
    UIView *destinationView = [self toViewController: context].view;

    containerView.backgroundColor = [UIColor clearColor];

    destinationView.alpha = 0;
    [containerView addSubview: sourceView];
    [containerView addSubview: destinationView];

    //    [containerView addDebugBorder: [UIColor redColor]];

    [UIView animateWithDuration: [self transitionDuration: context] animations: ^{
        destinationView.alpha = 1;

    } completion: ^(BOOL finished) {
        [context completeTransition: YES];
    }];
}

- (void) dismissWithContext: (id <UIViewControllerContextTransitioning>) context {
    [super dismissWithContext: context];

    UIView *containerView = context.containerView;
    UIView *sourceView = [self fromViewController: context].view;
    UIView *destinationView = [self toViewController: context].view;

    containerView.backgroundColor = [UIColor clearColor];
    [containerView addSubview: sourceView];
    [containerView addSubview: destinationView];

    [UIView animateWithDuration: [self transitionDuration: context] animations: ^{
        destinationView.alpha = 0;
    } completion: ^(BOOL finished) {
        [destinationView removeFromSuperview];
        [context completeTransition: YES];

        if (releasesAnimator) {
            UIViewController *fromController = [self fromViewController: context];
            fromController.navigationController.delegate = nil;
        }

    }];
}


@end