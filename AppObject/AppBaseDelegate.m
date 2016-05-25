


#import "AppBaseDelegate.h"
#import "Reachability.h"
@interface AppBaseDelegate(){
    
    Reachability *reach;
}

 


@end

@implementation AppBaseDelegate
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self startNetWork];
    }
    return self;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)startNetWork{
    
    NSLog(@"开启网络检测");
    reach = [Reachability reachabilityForInternetConnection];
    NSLog(@"-- 当前网络状态: %@", reach.currentReachabilityString);
    
    // start the notifier which will cause the reachability object to retain itself!
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];
}
- (void) reachabilityChanged: (NSNotification*)note {
    Reachability * _reach = [note object];
    
    NSLog(@"-- 当前网络状态: %@", reach.currentReachabilityString);
    
    if (_reach.isReachableViaWiFi) {
        //        NSLog(@"%@",@"当前通过wifi连接");
    }
    
    if (reach.isReachableViaWWAN) {
        //        NSLog(@"%@",@"当前通过2G or 3G or 4G连接");
        
    }
    
    if(![_reach isReachable])
    {
        //        NSLog(@"%@",@"网络不可用");
    }
}

-(BOOL)isReachable{
    return [reach isReachable];
}
-(BOOL)isReachableViaWWAN{
    return [reach isReachableViaWWAN];
}
-(BOOL)isReachableViaWiFi{
    return [reach isReachableViaWiFi];
}
 

NSString * const NotificationCategoryIdent  = @"ACTIONABLE";

/** 注册APNS */
- (void)registerApplicationRemoteNotification {
#ifdef __IPHONE_8_0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        UIMutableUserNotificationCategory *actionCategory;
        actionCategory = [[UIMutableUserNotificationCategory alloc] init];
        [actionCategory setIdentifier:NotificationCategoryIdent];
        [actionCategory setActions:nil
                        forContext:UIUserNotificationActionContextDefault];
        
        NSSet *categories = [NSSet setWithObject:actionCategory];
        UIUserNotificationType types = (UIUserNotificationTypeAlert |
                                        UIUserNotificationTypeSound |
                                        UIUserNotificationTypeBadge);
        
        UIUserNotificationSettings *settings;
        settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                       UIRemoteNotificationTypeSound |
                                                                       UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
#pragma clang diagnostic pop
    }
#else
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert |
                                                                   UIRemoteNotificationTypeSound |
                                                                   UIRemoteNotificationTypeBadge);
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
#pragma clang diagnostic pop
    
#endif
}
@end
