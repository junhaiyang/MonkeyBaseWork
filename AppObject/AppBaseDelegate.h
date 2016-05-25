 

#import <UIKit/UIKit.h>

@interface AppBaseDelegate : UIResponder


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;

- (void)registerApplicationRemoteNotification;

-(void)activateRemoteNotification;
-(void)delayReceiveRemoteNotification;

-(BOOL)isReachable;
-(BOOL)isReachableViaWWAN;
-(BOOL)isReachableViaWiFi;
 

@end
