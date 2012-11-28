//
//  UnusedClass.m
//  iOS4Test
//
//  Created by Alexander v. Below on 28.11.12.
//  Copyright (c) 2012 Alexander v. Below. All rights reserved.
//

#import "UnusedClass.h"

@implementation UnusedClass

- (void) unusedMethod {
NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];

    // See https://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/cross_development/Using/using.html#//apple_ref/doc/uid/20002000-1114537
    
#warning The point of this example is here!
    
    // Unless commented out, the following line (well, the following two) will cause dyld to fail and
    // crash the app on iOS 4
    if (&UIPageViewControllerOptionSpineLocationKey != NULL)
        [options setObject:[NSNumber numberWithInt:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    // Most interestingly, this code however works exactly as expected, and does not cause the app
    // to crash.
    if (&UIPageViewControllerOptionInterPageSpacingKey != NULL)
        [options setObject:@0 forKey:UIPageViewControllerOptionInterPageSpacingKey];

    // Is this an Apple Bug? Am I doing it wrong?
    
}
@end
