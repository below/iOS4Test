//
//  UnusedClass.m
//  iOS4Test
//
//  Created by Alexander v. Below on 28.11.12.
//  Copyright (c) 2012 Alexander v. Below. All rights reserved.
//

#import "UnusedClass.h"

@implementation UnusedClass

#warning The point of this example is here!

//  See
//  https://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/cross_development/Using/using.html#//apple_ref/doc/uid/20002000-1114537
//  http://lists.apple.com/archives/xcode-users/2012/Nov/msg00245.html


// This is important
UIKIT_EXTERN NSString * const UIPageViewControllerOptionSpineLocationKey NS_AVAILABLE_IOS(5_0);

- (void) unusedMethod {
NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];

    if (&UIPageViewControllerOptionSpineLocationKey != NULL)
        [options setObject:[NSNumber numberWithInt:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    if (&UIPageViewControllerOptionInterPageSpacingKey != NULL)
        [options setObject:@0 forKey:UIPageViewControllerOptionInterPageSpacingKey];
    
}
@end
