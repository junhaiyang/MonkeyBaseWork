 

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (AppPushPop)

- (void) switchToViewControllerToClass:(Class) cla animated:(BOOL) animated;

@end

@interface UIViewController (AppPushPop)

- (UINavigationController *)presentNavigationViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion;

@end
