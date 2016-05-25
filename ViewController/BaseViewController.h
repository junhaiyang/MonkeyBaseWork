 
#import <UIKit/UIKit.h>
#import "SBKeyboardCenter.h"


@interface BaseViewController : UIViewController{
    
@public 
    NSMutableArray *_cellcdatas; 
    SBKeyboardCenter  *keyboardCenter;
}

@property (nonatomic,weak) IBOutlet UIScrollView *scrollView; //滚动界面



//添加键盘监听事件
-(void)addKeyboard:(UIView *)targetView showKeyboard:(SBKeyboardShowCallBlock)showBlock tapGesture:(SBKeyboardTapCallBlock)tapBlock hideKeyboard:(SBKeyboardHideCallBlock)hideBlock;
-(void)leftBackHidden:(BOOL)hidden;

//键盘弹出后点击事件生效
-(void)invalidteKeyboardTap;

//键盘弹出后点击事件无效
-(void)uninvalidteKeyboardTap;

//移除键盘监听
-(void)removeKeyboardEvent;


@end
