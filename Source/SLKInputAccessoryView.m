//
//  SlackTextViewController
//  https://github.com/slackhq/SlackTextViewController
//
//  Copyright 2014-2016 Slack Technologies, Inc.
//  Licence: MIT-Licence
//

#import "SLKInputAccessoryView.h"

#import "SLKUIConstants.h"

@implementation SLKInputAccessoryView

#pragma mark - Super Overrides

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview) {
        if (SLK_IS_IOS9_AND_HIGHER) {
            
            NSPredicate *windowPredicate = [NSPredicate predicateWithFormat:@"self isMemberOfClass: %@", NSClassFromString(@"UIRemoteKeyboardWindow")];
            UIWindow *keyboardWindow = [[[UIApplication sharedApplication].windows filteredArrayUsingPredicate:windowPredicate] firstObject];
            
            for (UIView *subview in keyboardWindow.subviews) {
                for (UIView *hostview in subview.subviews) {
                    if ([hostview isMemberOfClass:NSClassFromString(@"UIInputSetHostView")]) {
                        _keyboardViewProxy = hostview;
                        break;
                    }
                }
            }
        }
        else {
            _keyboardViewProxy = newSuperview;
        }
    }
}

@end
