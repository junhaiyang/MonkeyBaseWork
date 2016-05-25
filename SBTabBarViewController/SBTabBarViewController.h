

#import "RDVTabBarController.h"
#import "SBTabBarControllerHeader.h"

@interface SBTabBarViewController : RDVTabBarController


- (BOOL)tabBar:(RDVTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index;
- (void) switchSelectedIndex:(NSUInteger) index;

@end
