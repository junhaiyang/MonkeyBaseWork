//
//  UIAppNavigationController.m
//  Pods
//
//  Created by junhai on 16/1/20.
//
//

#import "UIAppNavigationController.h"

@interface UIAppNavigationController ()

@end

@implementation UIAppNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        if (gestureRecognizer==self.interactivePopGestureRecognizer) {
            if (self.viewControllers.count<2||self.visibleViewController == [self.viewControllers objectAtIndex:0]) {
                return NO;
            }
        }
    }
    
    return YES;
}
-(BOOL)shouldAutorotate
{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end
