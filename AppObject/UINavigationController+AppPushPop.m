 
#import "UINavigationController+AppPushPop.h"
#import "UIAppNavigationController.h"

@implementation UINavigationController (AppPushPop)

 


- (void) switchToViewControllerToClass:(Class) cla animated:(BOOL) animated{
    
    NSMutableArray *navVC = [NSMutableArray arrayWithArray:self.viewControllers];
    
    NSMutableArray *showVC = [NSMutableArray new];
    
    BOOL found = NO;
    
    for (int i=navVC.count-1; i>=0; i--) {
        UIViewController *vc = [navVC objectAtIndex:i];
        [showVC addObject:vc];
        if ([vc isKindOfClass:cla]) {
            
            found =  YES;
            
            break;
        }
    }
    
    if(!found){
        [showVC addObject:[[cla alloc] init]];
    }
    [self setViewControllers:showVC animated:animated]; 
}

 
@end
@implementation UIViewController (AppPushPop)

- (UINavigationController *)presentNavigationViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion{
    
    UINavigationController *navController =[[UIAppNavigationController alloc] initWithRootViewController:viewControllerToPresent];
    navController.navigationBarHidden = YES;
    
    [self presentViewController:navController animated:flag completion:completion];
    return navController;
}

@end
