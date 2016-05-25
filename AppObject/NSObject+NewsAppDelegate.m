 

#import "NSObject+NewsAppDelegate.h"

@implementation NSObject(NewsAppDelegate)
-(UINavigationController *)appDelegate_navigationController{
    return [self appDelegate_].navigationController;
} 
-(AppBaseDelegate *)appDelegate_{
    AppBaseDelegate *appDelegate =[UIApplication sharedApplication].delegate;
    return appDelegate;
}
-(UIWindow *)appWindow_{
    AppBaseDelegate *appDelegate =[UIApplication sharedApplication].delegate;
    return appDelegate.window;
} 
-(UIViewController *)current_present_viewcontroller{
    UIViewController *presentedViewController =[self appDelegate_navigationController];
    while (true) {
        if(presentedViewController.presentedViewController){
            presentedViewController = presentedViewController.presentedViewController;
        }else{
            break;
        }
    }
    
    return presentedViewController;
}
-(UIViewController *)current_top_viewcontroller{
    UIViewController *presentedViewController =[self current_present_viewcontroller ];
    if([presentedViewController isKindOfClass:[UINavigationController class]]){
        UIViewController *topViewController =((UINavigationController *)presentedViewController).topViewController;
        return topViewController;
        
    }else{
        return presentedViewController;
    }
    
}

@end
