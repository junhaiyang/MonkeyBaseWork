

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SBKeyboardShowCallBlock)(NSDictionary *userInfo);
typedef void(^SBKeyboardTapCallBlock)(void);
typedef void(^SBKeyboardHideCallBlock)(void);

@interface SBKeyboardCenter : NSObject

//添加键盘监听事件
-(void)addKeyboard:(UIView *)targetView showKeyboard:(SBKeyboardShowCallBlock)showBlock tapGesture:(SBKeyboardTapCallBlock)tapBlock hideKeyboard:(SBKeyboardHideCallBlock)hideBlock;


//键盘弹出后点击事件生效
-(void)invalidteKeyboardTap;

//键盘弹出后点击事件无效
-(void)uninvalidteKeyboardTap;

//移除键盘监听
-(void)removeKeyboardEvent;

@end
