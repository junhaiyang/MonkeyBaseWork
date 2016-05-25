 

#import <Foundation/Foundation.h>
#import "AppBaseDelegate.h"

@interface NSObject(NewsAppDelegate)

-(UINavigationController *)appDelegate_navigationController;

-(AppBaseDelegate *)appDelegate_;
-(UIWindow *)appWindow_; 

-(UIViewController *)current_present_viewcontroller;
-(UIViewController *)current_top_viewcontroller;

@end
