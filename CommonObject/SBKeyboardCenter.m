//
//  SBKeyboardCenter.m
//  Pods
//
//  Created by junhai on 16/4/16.
//
//

#import "SBKeyboardCenter.h"


@interface SBKeyboardCenter(){ 

}

@property (nonatomic,strong)SBKeyboardShowCallBlock callShowBlock;
@property (nonatomic,strong)SBKeyboardTapCallBlock tapShowBlock;
@property (nonatomic,strong)SBKeyboardHideCallBlock hideShowBlock;
@property (nonatomic,strong)UITapGestureRecognizer *tapViewGestureRecognizer;

@property (nonatomic,weak)UIView *mytargetView;

@end

@implementation SBKeyboardCenter

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
-(void)initKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keybordChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keybordHide) name:UIKeyboardWillHideNotification  object:nil];
}

-(void)finishedKeyboardNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//添加键盘监听事件
-(void)addKeyboard:(UIView *)targetView showKeyboard:(SBKeyboardShowCallBlock)showBlock tapGesture:(SBKeyboardTapCallBlock)tapBlock hideKeyboard:(SBKeyboardHideCallBlock)hideBlock{
    self.tapShowBlock=tapBlock;
    self.callShowBlock=showBlock;
    self.hideShowBlock=hideBlock;
    
    if([self.mytargetView isEqual:targetView])
        return;
    
    if(!self.tapViewGestureRecognizer)
        self.tapViewGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewGestureAction)];
         
    [targetView addGestureRecognizer:self.tapViewGestureRecognizer];
    self.mytargetView  = targetView;
    
    [self finishedKeyboardNotification];
    [self initKeyboardNotification];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
} 
-(void)tapViewGestureAction{
    self.tapViewGestureRecognizer.enabled = NO;
    if(self.tapShowBlock){
        self.tapShowBlock();
    }
}
-(void)keybordChange:(NSNotification*)notification{
    
    NSDictionary *userInfo = [notification userInfo];
    if(self.callShowBlock){
        self.callShowBlock(userInfo);
    }
    
    self.tapViewGestureRecognizer.enabled = YES;
}

-(void)keybordHide{
    self.tapViewGestureRecognizer.enabled = NO;
    
    if(self.hideShowBlock){
        self.hideShowBlock();
    }
}

//键盘弹出后点击事件生效
-(void)invalidteKeyboardTap{
    self.tapViewGestureRecognizer.enabled = YES;
}

//键盘弹出后点击事件无效
-(void)uninvalidteKeyboardTap{
    self.tapViewGestureRecognizer.enabled = NO;
}

//移除键盘监听
-(void)removeKeyboardEvent{
    [self.mytargetView  removeGestureRecognizer:self.tapViewGestureRecognizer];
    [self finishedKeyboardNotification];
    
    self.callShowBlock =NULL;
    self.tapShowBlock=NULL;
    self.hideShowBlock = NULL;
    self.tapViewGestureRecognizer =nil;
    
    self.mytargetView = nil; 
    
}

@end
