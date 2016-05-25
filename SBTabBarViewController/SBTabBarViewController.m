 

#import "SBTabBarViewController.h"

@implementation SBTabBarViewController

#pragma mark - super tabbar
- (BOOL)tabBar:(RDVTabBar *)tabBar shouldSelectItemAtIndex:(NSInteger)index
{
    return YES;
}

- (void)tabBar:(RDVTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index
{
    UIViewController<UITabBarViewControllerItemActionDelegate> *controller =(UIViewController<UITabBarViewControllerItemActionDelegate> *)self.selectedViewController;
    if(self.selectedIndex ==index){
        
        if([controller respondsToSelector:@selector(userClickTabBarController:)])
            [controller userClickTabBarController:YES];
        
        NSLog(@"---didSelectItemAtIndex----");
        return;
    }
    
    [super tabBar:tabBar didSelectItemAtIndex:index];
    
    if([controller respondsToSelector:@selector(userClickTabBarController:)])
        [controller userClickTabBarController:NO];
    
}

- (void) switchSelectedIndex:(NSUInteger) index
{
    if ([self tabBar:self.tabBar shouldSelectItemAtIndex:index])
    {
        self.selectedIndex = index;
        [self tabBar:self.tabBar didSelectItemAtIndex:index];
    }
}

@end
