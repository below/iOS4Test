iOS4Test
========

Originally, I created this project to get help on a question, but a nice side effect of preparing sample code, and explaining it to an audience is that you carefully reexamine what you did — and as a side effect you find the solution yourself.

The key question was:

Why does 

    if (&UIPageViewControllerOptionSpineLocationKey != NULL)

cause dyld to fail on iOS 4 (effectively crashing the app on launch), whereas

    if (&UIPageViewControllerOptionInterPageSpacingKey != NULL)

does not?

The [Apple Documentation](https://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/cross_development/Using/using.html#//apple_ref/doc/uid/20002000-1114537) says that this should work, if, well if:

* "The base SDK for your Xcode project must be iOS 4.2 or newer.": Check 
* "The deployment target for your project must be iOS 3.1 or newer.": Check
* "The compiler for your project must be the LLVM-GCC 4.2 compiler or newer": Check
* "You must ensure that any frameworks not available in your project’s deployment target are weakly linked, rather than required": Che… oh, wait!

The framework in question is actually `UIKit.frameworki`. While it is most certainly available on any iOS, it is not available in the *version* we are looking for.

In order to allow weak linking for `UIPageViewControllerOptionSpineLocationKey`, it is necessary to go to the target's Build Phases, and in the "Link Binary With Libraries" section set the `UIKit.frameworki` to "Optional".

This will fix the issue.

What still puzzles me is why `UIPageViewControllerOptionInterPageSpacingKey` does not require this step. Any hints are appreciated.
