//
// Created by Dani Postigo on 5/10/14.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BasicAnimator : NSObject <UIViewControllerAnimatedTransitioning> {
    NSTimeInterval transitionDuration;
    BOOL isPresenting;
    BOOL isInteractive;
    BOOL releasesAnimator;
}

@property(nonatomic) NSTimeInterval transitionDuration;
@property(nonatomic, getter = presenting) BOOL isPresenting;

@property(nonatomic) BOOL isInteractive;
@property(nonatomic) BOOL releasesAnimator;
- (void) animateWithContext: (id <UIViewControllerContextTransitioning>) transitionContext;
- (void) presentWithContext: (id <UIViewControllerContextTransitioning>) context;
- (void) dismissWithContext: (id <UIViewControllerContextTransitioning>) context;
- (UIViewController *) toViewController: (id <UIViewControllerContextTransitioning>) transitionContext;
- (UIViewController *) fromViewController: (id <UIViewControllerContextTransitioning>) transitionContext;
@end