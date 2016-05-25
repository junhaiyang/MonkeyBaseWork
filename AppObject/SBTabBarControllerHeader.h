//
//  SBTabBarControllerHeader.h
//  Pods
//
//  Created by junhai on 16/1/31.
//
//

#ifndef SBTabBarControllerHeader_h
#define SBTabBarControllerHeader_h

#import <UIKit/UIKit.h>

@protocol UITabBarViewControllerItemActionDelegate <NSObject>

-(void)userClickTabBarController:(BOOL)again;

@end

@protocol UITabBarViewControllerActionDelegate <NSObject>

- (void) switchSelectedIndex:(NSUInteger) index;

@end

#endif /* SBTabBarControllerHeader_h */
